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
// Config Angular
//= require main
// Charts
//= require nvd3-rails
//= require_tree

// Example higchart negative cloumns
// $(function () {
//     $('#container').highcharts({
//         chart: {
//             type: 'column'
//         },
//         title: {
//             text: 'Column chart with negative values'
//         },
//         xAxis: {
//             categories: ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
//         },
//         credits: {
//             enabled: false
//         },
//         series: [{
//             name: 'John',
//             data: [5, 3, 4, 7, 2]
//         }, {
//             name: 'Jane',
//             data: [2, -2, -3, 2, 1]
//         }, {
//             name: 'Joe',
//             data: [3, 4, 4, -2, 5]
//         }]
//     });
// });
//
// // Basic pie chart
//
// $(function () {
//     $('#container2').highcharts({
//         chart: {
//             plotBackgroundColor: null,
//             plotBorderWidth: null,
//             plotShadow: false
//         },
//         title: {
//             text: 'Browser market shares at a specific website, 2014'
//         },
//         tooltip: {
//             pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
//         },
//         plotOptions: {
//             pie: {
//                 allowPointSelect: true,
//                 cursor: 'pointer',
//                 dataLabels: {
//                     enabled: true,
//                     format: '<b>{point.name}</b>: {point.percentage:.1f} %',
//                     style: {
//                         color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
//                     }
//                 }
//             }
//         },
//         series: [{
//             type: 'pie',
//             name: 'Browser share',
//             data: [
//                 ['Firefox',   45.0],
//                 ['IE',       26.8],
//                 {
//                     name: 'Chrome',
//                     y: 12.8,
//                     sliced: true,
//                     selected: true
//                 },
//                 ['Safari',    8.5],
//                 ['Opera',     6.2],
//                 ['Others',   0.7]
//             ]
//         }]
//     });
// });
