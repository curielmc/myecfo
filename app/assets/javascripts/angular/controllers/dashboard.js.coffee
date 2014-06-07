@DashboardCtrl = ($scope) ->
  $scope.formInvestment = {}
  $scope.pieChart = (formInvestment) ->

    data = [
      {
        value: formInvestment.stock
        color: "#F38630"
      }
      {
        value: formInvestment.bonds
        color: "#E0E4CC"
      }
      {
        value: formInvestment.cash
        color: "#69D2E7"
      }
    ]
    pieChart = new Chart($("#canvas4").get(0).getContext("2d")).Pie(data)
    return pieChart

  $scope.showMoney = (value1, value2) ->
    if !value2
      return ""
    show_money = (value1/100) * value2
    return show_money