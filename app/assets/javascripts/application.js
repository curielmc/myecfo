// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
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

// Config Angular
//= require main
// Angular MVC
//= require ./angular/controllers/dashboard
// Charts
//= require allocations
// Jquery Mask Money
//= require jquery.maskMoney.min

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
      aux_by_year[value.year] = Math.round((Math.pow(aux1[value.year] / aux1[value.year - year], 1 / year) - 1) * 100)/100;
    }
    ammount_aux = aux1[value.year];
    return cont++;
  });
  return aux1;
  return aux_by_year;
};

function calculate_percetage(value, percentage){
  return (parseFloat(value) * parseFloat(percentage) / 100)
}