module ApplicationHelper
  def find_key_record(key)
    Option.where(key: key).first_or_initialize
  end

  def find_key(key)
    find_key_record(key).value
  end
end
