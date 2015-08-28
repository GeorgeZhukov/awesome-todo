app = angular.module('app',[
  'templates',
  'ngRoute',
  'ng-token-auth',
])

app.config([ '$authProvider',
  ($authProvider)->
    $authProvider.configure(
      apiUrl: ""
    )
])

app.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'IndexCtrl'
      )
])

app.controller('IndexCtrl', ['$scope', '$auth',
 ($scope, $auth)->
   $scope.test = ->
     $auth.submitLogin(
       email: "scofield.cross@gmail.com"
       password: "password"
     ).then (resp)->
       alert("success")
       console.log(resp)

])