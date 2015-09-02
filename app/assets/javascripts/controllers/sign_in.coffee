angular.module('app.controllers')
  .controller 'SignInController', ['$scope', '$auth', '$state', 'toaster',
    ($scope, $auth, $state, toaster)->

      $scope.login = ->
        $auth.submitLogin($scope.loginForm)
        .catch (resp) ->
          angular.forEach resp.errors, (msg) ->
            toaster.error msg
  ]