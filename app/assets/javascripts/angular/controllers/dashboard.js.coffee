@DashboardCtrl = ($scope) ->
  $scope.formInvestment = {}
  $scope.initial_value_combo = 100
  $scope.stocks = stocks
  $scope.bonds = bonds
  $scope.cash = cash
  $scope.aux1 = []
  $scope.aux_by_year = []
  $scope.second = []
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
    if !value1 || !value2
      return ""
    show_money = (value1/100) * value2
    return "#{show_money} $"

  $scope.calculate_percetage = (value, percentage) ->
    parseFloat(value) * parseFloat(percentage) / 100


  $scope.calculate_by_year = (year, ammount, ps, pb, pc) ->
    cont = 1
    ammount_aux = ammount
    angular.forEach stocks, (value, key) ->
      $scope.aux1[value.year] = ammount_aux * (1 + ($scope.calculate_percetage($scope.stocks[key].percentage, ps) + $scope.calculate_percetage($scope.bonds[key].percentage, pb) + $scope.calculate_percetage($scope.cash[key].percentage, pc)) / 100)
      $scope.aux_by_year[value.year] = Math.round((Math.pow($scope.aux1[value.year] / $scope.aux1[value.year - year], 1 / year) - 1) * 100) / 100  if cont >= year
      ammount_aux = $scope.aux1[value.year]
      cont++
    $scope.aux1
#    console.log $scope.aux1

    $scope.aux_by_year
#    console.log $scope.aux_by_year
