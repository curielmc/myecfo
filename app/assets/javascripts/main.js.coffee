# Angular Skeleton MVC
#= require_tree ./angular/controllers/
#= require_tree ./angular/directives/
#= require_tree ./angular/services/
#= require_tree ./angular/filters/

'use strict'
myApp = angular.module("myApp", [
  'ngResource'
])
#
#myApp.config ($routeProvider) ->
#  $routeProvider.when("/",
#    templateUrl: "/"
#    controller: "IndexCtrl"
#  ).otherwise redirectTo: "/"
#  return
