
testdata = [
  {
    key: "One"
    y: 5
  }
  {
    key: "Two"
    y: 2
  }
  {
    key: "Three"
    y: 9
  }
  {
    key: "Four"
    y: 7
  }
  {
    key: "Five"
    y: 4
  }
  {
    key: "Six"
    y: 3
  }
]

nv.addGraph ->
  width = nv.utils.windowSize().width - 40
  height = nv.utils.windowSize().height / 2 - 40
  chart = nv.models.pie().values((d) ->
    d
  ).width(width).height(height)
  d3.select("#allocation").datum([testdata]).transition().duration(1200).attr("width", width).attr("height", height).call chart
  chart
