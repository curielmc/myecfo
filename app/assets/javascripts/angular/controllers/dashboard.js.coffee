@DashboardCtrl = ($scope) ->
  $scope.formInvestment = {}
  $scope.initial_value_combo = 100
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
    new Chart($("#canvas4").get(0).getContext("2d")).Pie(data, { animation : false})
    year_1 = calculate_by_year(1, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_3 = calculate_by_year(3, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_5 = calculate_by_year(5, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_10 = calculate_by_year(10, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_20 = calculate_by_year(20, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_30 = calculate_by_year(30, formInvestment.investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)

    matrix_1 = calculate_best_values(year_1)
    matrix_3 = calculate_best_values(years_3)
    matrix_5 = calculate_best_values(years_5)
    matrix_10 = calculate_best_values(years_10)
    matrix_20 = calculate_best_values(years_20)
    matrix_30 = calculate_best_values(years_30)

    $(".worst table tr td.year_1").html(matrix_1[1])
    $(".worst table tr td.year_3").html(matrix_3[1])
    $(".worst table tr td.year_5").html(matrix_5[1])
    $(".worst table tr td.year_10").html(matrix_10[1])
    $(".worst table tr td.year_20").html(matrix_20[1])
    $(".worst table tr td.year_30").html(matrix_30[1])

    $(".best table tr td.year_1").html(matrix_1[2])
    $(".best table tr td.year_3").html(matrix_3[2])
    $(".best table tr td.year_5").html(matrix_5[2])
    $(".best table tr td.year_10").html(matrix_10[2])
    $(".best table tr td.year_20").html(matrix_20[2])
    $(".best table tr td.year_30").html(matrix_30[2])

    $(".best table tr td.year1").html(matrix_1[0])
    $(".best table tr td.year3").html(matrix_3[0])
    $(".best table tr td.year5").html(matrix_5[0])
    $(".best table tr td.year10").html(matrix_10[0])
    $(".best table tr td.year20").html(matrix_20[0])
    $(".best table tr td.year30").html(matrix_30[0])

    draw_bar(calculate_total_amount_for_year([matrix_1[0], matrix_3[0], matrix_5[0], matrix_10[0], matrix_20[0], matrix_30[0]], formInvestment.investment), "#canvas3");
    draw_bar(calculate_total_amount_for_year([matrix_1[1], matrix_3[1], matrix_5[1], matrix_10[1], matrix_20[1], matrix_30[1]], formInvestment.investment), "#canvas");
    draw_bar(calculate_total_amount_for_year([matrix_1[2], matrix_3[2], matrix_5[2], matrix_10[2], matrix_20[2], matrix_30[2]], formInvestment.investment), "#canvas2");
    return true

  $scope.showMoney = (value1, value2) ->
    if !value1 || !value2
      return ""
    show_money = (value1/100) * value2
    return "#{show_money} $"

  $scope.calculate_percetage = (value, percentage) ->
    parseFloat(value) * parseFloat(percentage) / 100

  $scope.validationSumTotal = (formInvestment) ->
    sumTotal = formInvestment.stock + formInvestment.bonds + formInvestment.cash
    if sumTotal == 100
      $(".form-group:not(.none_change)").removeClass("has-error has-feedback")
      $(".form-group:not(.none_change)").addClass("has-success has-feedback")
    else
      $(".form-group:not(.none_change)").removeClass("has-success has-feedback")
      $(".form-group:not(.none_change)").addClass("has-error has-feedback")
    return true