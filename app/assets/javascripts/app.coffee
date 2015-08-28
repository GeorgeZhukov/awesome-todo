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
     $auth
     .authenticate('facebook')
     .then (resp)->
       alert("success")
       console.log(resp)

])