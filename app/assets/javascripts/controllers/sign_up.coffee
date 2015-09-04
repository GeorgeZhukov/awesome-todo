angular.module('app.controllers')
  .controller 'SignUpController', ['$scope', '$auth', 'toaster',
    ($scope, $auth, toaster) ->
      $scope.signUp = ->
        $auth.submitRegistration($scope.signUpForm)
        .catch (resp) ->
          angular.forEach resp.data.errors.full_messages, (msg) ->
            toaster.error msg
  ]