//
//= require jquery
//= require jquery_ujs

// Angular Libraries
//= require angular
//= require angular-resource

// Charts library
//= require nvd3-rails
// Bootstrap Twitter Plugins
//= require bootstrap
//= require jquery.maskMoney.min
//= require numeral.min
// Config Angular
//= require main
// Angular MVC
//= require ./angular/controllers/dashboard

// Charts
//= require allocations
// Jquery Mask Money

//$("#amount").maskMoney();

//
//
calculate_by_year = function(year, ammount, ps, pb, pc) {
  var ammount_aux, aux1, aux_by_year, cont;
  cont = 1;
  aux1 = [];
  aux_by_year = [];
  ammount_aux = ammount;
  aux1[1927] = ammount;
  angular.forEach(stocks, function(value, key) {
    aux1[value.year] = ammount_aux * (1 + (calculate_percetage(stocks[key].percentage, ps) + calculate_percetage(bonds[key].percentage, pb) + calculate_percetage(cash[key].percentage, pc)) / 100);
    if (cont >= year) {
      aux_by_year[value.year] = Math.pow(aux1[value.year] / aux1[value.year - year], 1 / year) - 1;
    }
    ammount_aux = aux1[value.year];
    return cont++;
  });
  return aux_by_year;
};

function calculate_percetage(value, percentage){
  return (parseFloat(value) * parseFloat(percentage) / 100)
}

function calculate_best_values(hvalues) {
  var max_values = [];
  var cont = 0;
  max_values[2] = 0;
  angular.forEach(hvalues, function (value, key) {
    // 0 for best
    if (typeof(max_values[0]) === "undefined" || value > max_values[0]) {
      max_values[0] = value;
    }
    // 1 for worst
    if (typeof(max_values[1]) === "undefined" || value < max_values[1]) {
      max_values[1] = value;
    }
    // 2 for average
    max_values[2] += value;
    return cont++;
  });
  max_values[0] = max_values[0];
  max_values[1] = max_values[1];
  max_values[2] = max_values[2] / cont;
  return max_values;
}


function draw_bar(datas, selector) {
  nv.addGraph(function() {
    var valuesTotal = [{
      key: "veamos como esta",
      values: datas
    }]

    var chart = nv.models.discreteBarChart()
        .x(function(d) { return d })    //Specify the data accessors.
        .y(function(d) { return d })
        .staggerLabels(true)    //Too many bars and not enough room? Try staggering labels.
        .tooltips(false)        //Don't show tooltips
        .showValues(true)       //...instead, show the bar value right on top of each bar.
        .transitionDuration(350);

    d3.select(selector + " svg")
      .datum(valuesTotal)
      .call(chart);

    nv.utils.windowResize(chart.update);

    return chart;
  });

}

function draw_pie(datas){
  nv.addGraph(function() {
    var chart = nv.models.pieChart()
      .x(function(d) { return d.key })
      .y(function(d) { return d.value })
      .showLabels(true);

    d3.select("#canvas4 svg")
      .datum(datas)
      .transition().duration(350)
      .call(chart);

    return chart;
  });

}

function calculate_total_amount_for_year(values, amount){
  var years = [1, 3, 5, 10, 20, 30];
  var changes = jQuery.map(values, function(value, cont){
    return(amount * Math.pow((1 + value), years[cont]));
  });
  return changes;
}