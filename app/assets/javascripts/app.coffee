app = angular.module('app',[
  'templates',
  'ngRoute',
  'ng-token-auth',
  'toaster',
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
        controller: 'pageCtrl'
      )
])

app.controller 'pageCtrl', ['$scope', '$auth', 'toaster',
  ($scope, $auth, toaster)->
    $scope.$on('auth:logout-success', (ev, data) ->
      toaster.success 'You have logged out.'
    )

    $scope.login = ->
      console.log $scope.loginForm
      $auth.submitLogin($scope.loginForm)
      .then (resp) ->
        toaster.success 'You have successfully logged in.'
      .catch (resp) ->
        angular.forEach resp.errors, (msg) ->
          toaster.error msg

    $scope.logout = ->
      $auth.signOut()
]
