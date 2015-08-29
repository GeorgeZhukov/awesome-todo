angular.module('app')
  .controller 'pageCtrl', ['$scope', '$auth', 'toaster',
    ($scope, $auth, toaster)->
      $scope.login = ->
        $auth.submitLogin($scope.loginForm)
        .then (resp) ->
          toaster.success 'You have successfully logged in.'
        .catch (resp) ->
          angular.forEach resp.errors, (msg) ->
            toaster.error msg

      $scope.logout = ->
        $auth.signOut().then (resp) -> toaster.success 'You have logged out.'
  ]