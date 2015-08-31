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

.controller 'ProjectsCtrl', ['$scope', '$auth', '$state', 'Restangular', 'toaster', ($scope, $auth, $state, Restangular, toaster) ->
  Restangular.all('projects').getList().then(
    (projects)->
      _.map(projects,
        (project)->
          project.tasks = project.all('tasks').getList().$object
      )
      $scope.projects = projects
  )

  $scope.new_project = ->
    $state.go 'new_project'
]

.controller 'NewProjectCtrl', ['$scope', 'Restangular', '$state', 'toaster', ($scope, Restangular, $state, toaster) ->
  $scope.create = ->
    Restangular.service('projects').post($scope.project).then(
      ->
        toaster.success "The project has been successfully created."
        $state.go 'projects'
    )

]