@DashboardCtrl = ($scope) ->
  $scope.formInvestment = {}
  $scope.initial_value_combo = 100
  $scope.pieChart = (formInvestment) ->
    investment = numeral().unformat(formInvestment.investment);
    data = [{
        value: formInvestment.stock
        key: "Stock"
      }, {
        value: formInvestment.bonds
        key: "Bonds"
      }, {
        value: formInvestment.cash
        key: "Cash"
      }
    ]
    draw_pie(data)
    year_1 = calculate_by_year(1, investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_3 = calculate_by_year(3, investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_5 = calculate_by_year(5, investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_10 = calculate_by_year(10, investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_20 = calculate_by_year(20, investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)
    years_30 = calculate_by_year(30, investment, formInvestment.stock, formInvestment.bonds, formInvestment.cash)

    matrix_1 = calculate_best_values(year_1)
    matrix_3 = calculate_best_values(years_3)
    matrix_5 = calculate_best_values(years_5)
    matrix_10 = calculate_best_values(years_10)
    matrix_20 = calculate_best_values(years_20)
    matrix_30 = calculate_best_values(years_30)

    $(".worst table tr td.year_1").html(numeral(matrix_1[1]).format('0.00%'))
    $(".worst table tr td.year_3").html(numeral(matrix_3[1]).format('0.00%'))
    $(".worst table tr td.year_5").html(numeral(matrix_5[1]).format('0.00%'))
    $(".worst table tr td.year_10").html(numeral(matrix_10[1]).format('0.00%'))
    $(".worst table tr td.year_20").html(numeral(matrix_20[1]).format('0.00%'))
    $(".worst table tr td.year_30").html(numeral(matrix_30[1]).format('0.00%'))

    $(".best table tr td.year_1").html(numeral(matrix_1[2]).format('0.00%'))
    $(".best table tr td.year_3").html(numeral(matrix_3[2]).format('0.00%'))
    $(".best table tr td.year_5").html(numeral(matrix_5[2]).format('0.00%'))
    $(".best table tr td.year_10").html(numeral(matrix_10[2]).format('0.00%'))
    $(".best table tr td.year_20").html(numeral(matrix_20[2]).format('0.00%'))
    $(".best table tr td.year_30").html(numeral(matrix_30[2]).format('0.00%'))

    $(".best table tr td.year1").html(numeral(matrix_1[0]).format('0.00%'))
    $(".best table tr td.year3").html(numeral(matrix_3[0]).format('0.00%'))
    $(".best table tr td.year5").html(numeral(matrix_5[0]).format('0.00%'))
    $(".best table tr td.year10").html(numeral(matrix_10[0]).format('0.00%'))
    $(".best table tr td.year20").html(numeral(matrix_20[0]).format('0.00%'))
    $(".best table tr td.year30").html(numeral(matrix_30[0]).format('0.00%'))

    draw_bar(calculate_total_amount_for_year([matrix_1[0], matrix_3[0], matrix_5[0], matrix_10[0], matrix_20[0], matrix_30[0]], investment), "#canvas3");
    draw_bar(calculate_total_amount_for_year([matrix_1[1], matrix_3[1], matrix_5[1], matrix_10[1], matrix_20[1], matrix_30[1]], investment), "#canvas");
    draw_bar(calculate_total_amount_for_year([matrix_1[2], matrix_3[2], matrix_5[2], matrix_10[2], matrix_20[2], matrix_30[2]], investment), "#canvas2");

    HashArgs.set("amount", investment);
    HashArgs.set("stocks", formInvestment.stock);
    HashArgs.set("bonds", formInvestment.bonds);
    HashArgs.set("cash", formInvestment.cash);
    return true

  $scope.showMoney = (investment, allocation) ->
    if !investment || !allocation
      return ""
    result = (numeral().unformat(investment) / 100) * allocation
    return numeral(result).format('$0,0')

  $scope.validationSumTotal = (formInvestment) ->
    sumTotal = formInvestment.stock + formInvestment.bonds + formInvestment.cash
    if sumTotal == 100
      $(".form-group:not(.none_change)").removeClass("has-error has-feedback")
      $(".form-group:not(.none_change)").addClass("has-success has-feedback")
    else
      $(".form-group:not(.none_change)").removeClass("has-success has-feedback")
      $(".form-group:not(.none_change)").addClass("has-error has-feedback")
    return true