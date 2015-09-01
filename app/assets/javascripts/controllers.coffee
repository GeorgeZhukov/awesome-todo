angular.module('controllers', ['restangular', 'toaster', 'ng-token-auth',])

  .config(['RestangularProvider', (RestangularProvider) ->
      RestangularProvider.setBaseUrl('/');
      RestangularProvider.setRequestSuffix('.json');
    ])

  .controller 'PageCtrl', ['$scope', '$auth', 'toaster', ($scope, $auth, toaster) ->
    $scope.$on 'auth:logout-success', (resp) ->
      toaster.success 'You have logged out.'
  ]

  .controller 'SignInCtrl', ['$scope', '$auth', '$state', 'toaster', ($scope, $auth, $state, toaster)->
    $scope.login = ->
      $auth.submitLogin($scope.loginForm)
      .then (resp) ->
        toaster.success 'You have successfully logged in.'
        $state.go('projects')
      .catch (resp) ->
        angular.forEach resp.errors, (msg) ->
          toaster.error msg
  ]

  .controller 'SignUpCtrl', ['$scope', '$auth', '$state', 'toaster', ($scope, $auth, $state, toaster) ->
    $scope.signUp = ->
      $auth.submitRegistration($scope.signUpForm)
      .then (resp) ->
        toaster.success 'You have successfully registered.'
        $state.go 'projects'

      .catch (resp) ->
        angular.forEach resp.data.errors.full_messages, (msg) ->
          toaster.error msg
  ]

  .controller 'ProjectsCtrl', ['$scope', '$auth', 'Restangular', 'toaster', ($scope, $auth, Restangular, toaster) ->
    updateProjects = ->
      $scope.projects = Restangular.all('projects').getList().$object;

    $scope.removeProject = (project) ->
      project.remove().then(
        ->
          toaster.success "The project has been successfully removed."
          updateProjects()
      )

    updateProjects()
  ]

  .controller 'ProjectCtrl', ['$scope', '$state', 'Restangular', 'toaster', ($scope, $state, Restangular, toaster) ->
    updateTasks = ->
      $scope.tasks = $scope.project.all('tasks').getList().$object

    $scope.addTask = ->
      $scope.project.all('tasks').post($scope.newTask).then(updateTasks)

    $scope.removeTask = (task) ->
      task.remove().then(updateTasks)

    $scope.rm = (project) ->
      console.log $scope
      $scope.$parent.removeProject(project)

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