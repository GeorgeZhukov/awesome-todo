angular.module('app')

  .controller 'pageCtrl', ['$scope',
   ($scope) ->
     return
  ]

  .controller 'signInCtrl', ['$scope', '$auth', 'toaster',
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

  .controller 'signUpCtrl', ['$scope', '$auth', 'toaster',
     ($scope, $auth, toaster) ->
       $scope.signUp = ->
         $auth.submitRegistration($scope.signUpForm)
         .then (resp) ->
           toaster.success 'You have successfully registered.'

         .catch (resp) ->
           angular.forEach resp.data.errors.full_messages, (msg) ->
             toaster.error msg
  ]