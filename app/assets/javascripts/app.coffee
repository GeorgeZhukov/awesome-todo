angular.module 'app.services', []
angular.module 'app.controllers', ['app.services']

angular.module('app', [
    'app.controllers',
    'templates',
    'ui.router',
    'ng-token-auth',
    'restangular',
    'toaster',
    'ui.sortable',
    'xeditable',
    'angularFileUpload',
    'angular-loading-bar',
    'ngAnimate',
  ])

  .config(['$authProvider',
    ($authProvider)->
      $authProvider.configure(
        apiUrl: ""
      )
  ])

  .config(['RestangularProvider', (RestangularProvider) ->
    RestangularProvider
    .setBaseUrl('/')
    .setRequestSuffix('.json')
  ])

  .config(['$stateProvider', '$urlRouterProvider',
    ($stateProvider, $urlRouterProvider)->
      $urlRouterProvider.otherwise "/sign-in"

      $stateProvider
        .state 'signin',
          url: '/sign-in'
          templateUrl: 'signin.html'
          controller: 'SignInController'

        .state 'signup',
          url: '/sign-up',
          templateUrl: 'signup.html',
          controller: 'SignUpController'

        .state 'projects',
          url: '/projects',
          templateUrl: 'projects.html',
          controller: 'ProjectsController',
          resolve:
            auth: ($auth) -> $auth.validateUser()

        .state 'new_project',
          url: '/projects/new',
          templateUrl: 'new_project.html',
          controller: 'NewProjectController',
          resolve:
            auth: ($auth) -> $auth.validateUser()

  ])

  .run(['$state', '$auth', 'editableOptions',
    ($state, $auth, editableOptions) ->
      $auth.validateUser().then(-> $state.go 'projects')
      editableOptions.theme = 'bs3';
  ])



  .directive 'project', ->
    templateUrl: "_project.html"

  .directive 'task', ->
    templateUrl: "_task.html"

  .directive 'comment', ->
    templateUrl: "_comment.html"

