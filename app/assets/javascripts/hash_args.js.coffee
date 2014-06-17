class window.HashArgs

  # HashArgs parses individual chunks out of the
  # query param string.  It also allows treating
  # that as an ampersand-delimited string of
  # variables -- the variable is true if the
  # variable name is by itself, or it has the
  # value after the equals sign if there's an
  # equals sign.

  # A common use is to have a group of variables,
  # such as all parameters for a given widget.
  # That group of variables should have a common
  # prefix, allowing them to be set or removed
  # as a group.

HashArgs.all = () ->
  anchor = window.location.hash
  arg for arg in anchor.slice(1).split("&") when arg != ""

HashArgs.all_starting_with = (prefix) ->
  item for item in HashArgs.all() when item.slice(0, prefix.length) == prefix

HashArgs.all_not_starting_with = (prefix) ->
  item for item in HashArgs.all() when item.slice(0, prefix.length) != prefix

HashArgs.all_except_var = (v) ->
  item for item in HashArgs.all() when item != v && item.slice(0, v.length + 1) != (v + "=")

HashArgs.remove_starting_with = (prefix) ->
  HashArgs.all_not_starting_with(prefix)

HashArgs.replace_with_prefix = (old_val, new_val) ->
  new_args = HashArgs.remove_starting_with(old_val).concat(new_val)
  HashArgs.from(new_args)

# Set all hash arguments from the list of arguments given
HashArgs.from = (args) ->
  window.location.hash = "#" + args.join("&")
  if window.location.toString().size > 1800
    console.warn("Your URL is getting too long!")

# Get the value of a single named argument
HashArgs.get = (v) ->
  for item in HashArgs.all()
    return true if item == v
    if item.slice(0, v.length + 1) == (v + "=")
      return item.split("=", 2)[1]
  false

# Set a value for a single named argument.  A value of
# true mentions its name with no equals sign, while
# false doesn't include it in the list.
HashArgs.set = (v, val) ->
  args = HashArgs.all_except_var v
  if val == true
    args.push v
  else if val == false
    # Do nothing
  else
    args.push "#{v}=#{val}"
  HashArgs.from args