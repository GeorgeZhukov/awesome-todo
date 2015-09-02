angular.module('controllers', ['restangular', 'toaster', 'ng-token-auth',])

  .config(['RestangularProvider', (RestangularProvider) ->
      RestangularProvider.setBaseUrl('/');
      RestangularProvider.setRequestSuffix('.json');
    ])

  .controller 'PageController', ['$scope', '$auth', '$state', 'toaster',
    ($scope, $auth, $state, toaster) ->
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

  .controller 'SignInController', ['$scope', '$auth', '$state', 'toaster',
    ($scope, $auth, $state, toaster)->

      $scope.login = ->
        $auth.submitLogin($scope.loginForm)
        .catch (resp) ->
          angular.forEach resp.errors, (msg) ->
            toaster.error msg
  ]

  .controller 'SignUpController', ['$scope', '$auth', '$state', 'toaster',
    ($scope, $auth, $state, toaster) ->
      $scope.signUp = ->
        $auth.submitRegistration($scope.signUpForm)
        .catch (resp) ->
          angular.forEach resp.data.errors.full_messages, (msg) ->
            toaster.error msg
  ]

  .controller 'ProjectsController', ['$scope', '$auth', '$state', 'Restangular', 'toaster',
    ($scope, $auth, $state, Restangular, toaster) ->
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

  .controller 'NewProjectController', ['$scope', 'Restangular', '$state', 'toaster',
    ($scope, Restangular, $state, toaster) ->
      $scope.create = ->
        Restangular.service('projects').post($scope.project).then(
          ->
            toaster.success "The project has been successfully created."
            $state.go 'projects'
        )
  ]

  .controller 'ProjectController', ['$scope', '$state', 'Restangular', 'toaster',
    ($scope, $state, Restangular, toaster) ->
      updateTasks = ->
        $scope.tasks = $scope.project.all('tasks').getList().$object

      $scope.addTask = ->
        $scope.project.all('tasks').post($scope.newTask).then(updateTasks)
        $scope.newTask = {}

      $scope.removeTask = (task) ->
        task.remove().then(updateTasks)

      updateTasks()

  ]

  .controller 'TaskController', ['$scope', '$state', 'Restangular',
    ($scope, $state, Restangular) ->
      updateComments = ->
        Restangular.one('tasks', $scope.task.id).all('comments').getList().then(
          (comments)->
            _.map(comments,
              (comment)->
                comment.attached_files = Restangular.one('comments', comment.id).all('attached_files').getList().$object
            )
            $scope.comments = comments
        )
        #$scope.comments = Restangular.one('tasks', $scope.task.id).all('comments').getList().$object


      $scope.addComment = ->
        Restangular.one('tasks', $scope.task.id).all('comments').post($scope.newComment).then(updateComments)

      $scope.removeComment = (comment) ->
        comment.remove().then(updateComments)

      updateComments()
  ]