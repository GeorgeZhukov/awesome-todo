angular.module('app.controllers')
  .controller 'SignInController', ['$scope', '$auth', 'toaster',
    ($scope, $auth, toaster)->

      $scope.login = ->
        $auth.submitLogin($scope.loginForm)
        .catch (resp) ->
          angular.forEach resp.errors, (msg) ->
            toaster.error msg
  ]