angular.module('app.controllers')
.controller 'PageController', ['$scope', '$state', 'toaster',
  ($scope, $state, toaster) ->
    $scope.$on 'auth:validation-error', (resp) ->
      toaster.error 'Validation error.'
      $state.go 'signin'

    $scope.$on 'auth:invalid', (resp) ->
      toaster.error 'Invalid.'
      $state.go 'signin'

    $scope.$on 'auth:logout-success', (resp) ->
      toaster.success 'You have logged out.'
      $state.go 'signin'

    $scope.$on 'auth:login-success', (ev, user) ->
      toaster.success 'You have successfully logged in by email.'
      $state.go 'projects'

    $scope.$on 'auth:oauth-registration', (ev, user) ->
      toaster.success 'You have successfully logged in by facebook.'
      $state.go 'projects'

    $scope.$on 'auth:registration-email-success', (ev, message) ->
      toaster.success 'You have successfully registered.'
      $state.go 'projects'
]