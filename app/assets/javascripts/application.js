//
//= require jquery
//= require jquery_ujs

// Angular Libraries
//= require angular
//= require angular-resource

// Charts library
//= require Chart
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
  max_values[0] = (max_values[0] * 100).toFixed(2);
  max_values[1] = (max_values[1] * 100).toFixed(2) ;
  max_values[2] = (max_values[2] * 100 / cont).toFixed(2);
  return max_values;
}


function draw_bar(datas, selector) {
  data = {
    labels: ["1 year", "3 years", "5 years", "10 years", "20 years", "30 years"],
    datasets: [
      {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        data: datas
      }
    ],
    scaleOverride : true,
    //** Required if scaleOverride is true **
    //Number - The number of steps in a hard coded scale
    scaleSteps : 10,
    //Number - The value jump in the hard coded scale
    scaleStepWidth : null,
    //Number - The scale starting value
    scaleStartValue : -20,

    //String - Colour of the scale line
    scaleLineColor : "rgba(0,0,0,.3)",
    //String - Colour of the grid lines
    scaleGridLineColor : "rgba(0,0,5,.5)"
  };
  new Chart($(selector).get(0).getContext("2d")).Bar(data);
}


