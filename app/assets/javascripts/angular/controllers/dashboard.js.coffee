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
    year_1 = calculate_by_year(1, 100, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_3 = calculate_by_year(3, 100, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_5 = calculate_by_year(5, 100, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_10 = calculate_by_year(10, 100, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_20 = calculate_by_year(20, 100, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_30 = calculate_by_year(30, 100, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)

    return pieChart

  $scope.showMoney = (value1, value2) ->
    if !value1 || !value2
      return ""
    show_money = (value1/100) * value2
    return "#{show_money} $"

  $scope.calculate_percetage = (value, percentage) ->
    parseFloat(value) * parseFloat(percentage) / 100

  $scope.validationSumTotal = (formInvestment) ->
#    console.log(formInvestment.stock );
    sumTotal = formInvestment.stock + formInvestment.bonds + formInvestment.cash
#    console.log sumTotal
    if sumTotal == 100
      $(".form-group").removeClass("has-error has-feedback")
      $(".form-group").addClass("has-success has-feedback")
    else
      $(".form-group").removeClass("has-success has-feedback")
      $(".form-group").addClass("has-error has-feedback")

    return sumTotal