angular.module('app', ['templates', 'controllers', 'ui.router', 'ng-token-auth', 'restangular',  ])

  .config([ '$authProvider',
    ($authProvider)->
      $authProvider.configure(
        apiUrl: ""
      )
  ])

  .config([ '$stateProvider', '$urlRouterProvider',
    ($stateProvider, $urlRouterProvider)->
      $urlRouterProvider.otherwise "/sign-in"

      $stateProvider
        .state 'signin',
          url: '/sign-in'
          templateUrl: 'signin.html'
          controller: 'SignInCtrl'

        .state 'signup',
          url: '/sign-up',
          templateUrl: 'signup.html',
          controller: 'SignUpCtrl'

        .state 'projects',
          url: '/projects',
          templateUrl: 'projects.html',
          controller: 'ProjectsCtrl',
          resolve:
            auth: ['$auth', ($auth)-> $auth.validateUser()]

        .state 'new_project',
          url: '/projects/new',
          templateUrl: 'new_project.html',
          controller: 'NewProjectCtrl',
          resolve:
            auth: ['$auth', ($auth)-> $auth.validateUser()]


  ])

  .directive 'project', ->
    templateUrl: "_project.html"

  .directive 'task', ->
    templateUrl: "_task.html"

  .controller 'ProjectCtrl', ['$scope', '$state', 'Restangular', ($scope, $state, Restangular) ->
    updateTasks = ->
      $scope.tasks = $scope.project.all('tasks').getList().$object

    $scope.addTask = ->
      $scope.project.all('tasks').post($scope.newTask).then(updateTasks)

    $scope.removeTask = (task) ->
      task.remove().then(updateTasks)

    updateTasks()

  ]
