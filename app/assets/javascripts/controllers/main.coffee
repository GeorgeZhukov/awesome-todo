angular.module('app')

  .controller 'pageCtrl', ['$scope', '$auth', 'toaster',
   ($scope, $auth, toaster) ->

     window.validateUser = -> $auth.validateUser()
     $scope.logout = ->
       $auth.signOut().then (resp) -> toaster.success 'You have logged out.'
  ]

  .controller 'signInCtrl', ['$scope', '$auth', '$state', 'toaster',
    ($scope, $auth, $state, toaster)->

      $scope.login = ->
        $auth.submitLogin($scope.loginForm)
        .then (resp) ->
          toaster.success 'You have successfully logged in.'
          $state.go('projects')
        .catch (resp) ->
          angular.forEach resp.errors, (msg) ->
            toaster.error msg
  ]

  .controller 'signUpCtrl', ['$scope', '$auth', '$state', 'toaster',
     ($scope, $auth, $state, toaster) ->
       $scope.signUp = ->
         $auth.submitRegistration($scope.signUpForm)
         .then (resp) ->
           toaster.success 'You have successfully registered.'
           $state.go 'projects'

         .catch (resp) ->
           console.log resp
           angular.forEach resp.data.errors.full_messages, (msg) ->
             toaster.error msg
  ]

  .controller 'projectsCtrl', ['$scope', '$auth', 'Restangular', 'toaster',
     ($scope, $auth, Restangular, toaster) ->
       Restangular.all('projects').getList().then(
         (projects)->
           $scope.projects = projects
           projects[0].all('tasks').getList().then(
             (tasks)->
               $scope.tasks = tasks
           )
       )


  ]