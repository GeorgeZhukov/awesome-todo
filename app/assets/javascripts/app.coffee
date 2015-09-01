angular.module('app', ['templates', 'controllers', 'directives', 'ui.router', 'ng-token-auth', ])

  .config(['$authProvider',
    ($authProvider)->
      $authProvider.configure(
        apiUrl: ""
      )
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

  .run(['$state', '$auth',
    ($state, $auth) ->
      $auth.validateUser().then(-> $state.go 'projects')
  ])



