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
//= require hash_args
// Config Angular
//= require main
// Angular MVC
//= require ./angular/controllers/dashboard


function on_hashchange() {
  var amount = HashArgs.get("amount");
  var stocks = HashArgs.get("stocks");
  var bonds = HashArgs.get("bonds");
  var cash = HashArgs.get("cash");
  if(amount > 0){
    $("#amount").val(amount);
    $("#amount").triggerHandler("change");
  }
  if(stocks > 0){
    $("#stocks").val(stocks);
    $("#stocks").triggerHandler("change");
  }
  if(bonds > 0){
    $("#bounds").val(bonds);
    $("#bounds").triggerHandler("change");
  }
  if(cash > 0){
    $("#cash").val(cash);
    $("#cash").triggerHandler("change");
  }
  return false;
}

$(window).on('hashchange', on_hashchange);

$(on_hashchange);  // Also, call this on page load

$(document).ready(function(){
  $("#amount").maskMoney({precision: 0});
});

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
  var data_real = [{
    value: datas[0],
    label: "1 Year"
  },{
    value: datas[1],
    label: "3 Years"
  },{
    value: datas[2],
    label: "5 Years"
  },{
    value: datas[3],
    label: "10 Years"
  },{
    value: datas[4],
    label: "20 Years"
  },{
    value: datas[5],
    label: "30 Years"
  }];
  nv.addGraph(function() {
    var valuesTotal = [{
      key: "bar_data",
      values: data_real
    }]

    var chart = nv.models.discreteBarChart()
      .x(function(d) { return d.label })    //Specify the data accessors.
      .y(function(d) { return d.value })
      .staggerLabels(true)    //Too many bars and not enough room? Try staggering labels.
      .showValues(true)       //...instead, show the bar value right on top of each bar.
      .transitionDuration(350)
      .showYAxis(false)
      .valueFormat(function(x){ return numeral(x).format('($0.00 a)')})
      .tooltipContent(function (key, y, e, graph) {
        return '<h4>' + y + '</h4>' +
          '<p>' + numeral(e).format('($0.0 a)') + '</p>';
      });

    chart.xAxis     //Chart x-axis settings
      .axisLabel('Years');

    chart.yAxis     //Chart y-axis settings
      .axisLabel('Amount')
      .tickFormat(d3.format(',2.0s'));

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
      .labelType("percent")
      .color(["#800400", "#999999", "#01b204"]);

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