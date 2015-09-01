angular.module('controllers', ['restangular', 'toaster', 'ng-token-auth',])

  .config(['RestangularProvider', (RestangularProvider) ->
      RestangularProvider.setBaseUrl('/');
      RestangularProvider.setRequestSuffix('.json');
    ])

  .controller 'PageCtrl', ['$scope', '$auth', '$state', 'toaster', ($scope, $auth, $state, toaster) ->
    $scope.$on 'auth:logout-success', (resp) ->
      toaster.success 'You have logged out.'
      $state.go 'signin'

    $scope.$on 'auth:login-success', (ev, user) ->
      toaster.success 'You have successfully logged in.'
      $state.go 'projects'

    $scope.$on 'auth:registration-email-success', (ev, message) ->
      toaster.success 'You have successfully registered.'
      $state.go 'projects'
  ]

  .controller 'SignInCtrl', ['$scope', '$auth', '$state', 'toaster', ($scope, $auth, $state, toaster)->
    $scope.login = ->
      $auth.submitLogin($scope.loginForm)
      .catch (resp) ->
        angular.forEach resp.errors, (msg) ->
          toaster.error msg
  ]

  .controller 'SignUpCtrl', ['$scope', '$auth', '$state', 'toaster', ($scope, $auth, $state, toaster) ->
    $scope.signUp = ->
      $auth.submitRegistration($scope.signUpForm)
      .catch (resp) ->
        angular.forEach resp.data.errors.full_messages, (msg) ->
          toaster.error msg
  ]

  .controller 'ProjectsCtrl', ['$scope', '$auth', '$state', 'Restangular', 'toaster', ($scope, $auth, $state, Restangular, toaster) ->
    updateProjects = ->
      $scope.projects = Restangular.all('projects').getList().$object;

    $scope.new_project = ->
      $state.go 'new_project'

    $scope.removeProject = (project) ->
      project.remove().then(
        ->
          toaster.success "The project has been successfully removed."
          updateProjects()
      )

    updateProjects()
  ]

  .controller 'NewProjectCtrl', ['$scope', 'Restangular', '$state', 'toaster', ($scope, Restangular, $state, toaster) ->
    $scope.create = ->
      Restangular.service('projects').post($scope.project).then(
        ->
          toaster.success "The project has been successfully created."
          $state.go 'projects'
      )
  ]

  .controller 'ProjectCtrl', ['$scope', '$state', 'Restangular', 'toaster', ($scope, $state, Restangular, toaster) ->
    updateTasks = ->
      $scope.tasks = $scope.project.all('tasks').getList().$object

    $scope.addTask = ->
      $scope.project.all('tasks').post($scope.newTask).then(updateTasks)

    $scope.removeTask = (task) ->
      task.remove().then(updateTasks)

    $scope.qw = ->
      console.log $scope

    updateTasks()

  ]

  .controller 'TaskCtrl', ['$scope', '$state', 'Restangular', ($scope, $state, Restangular) ->
    updateComments = ->
      $scope.comments = Restangular.one('tasks', $scope.task.id).all('comments').getList().$object

    $scope.addComment = ->
      Restangular.one('tasks', $scope.task.id).all('comments').post($scope.newComment).then(updateComments)

    $scope.removeComment = (comment) ->
      comment.remove().then(updateComments)

    updateComments()
  ]