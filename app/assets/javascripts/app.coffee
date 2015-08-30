angular.module('app', ['templates', 'controllers', 'ui.router', 'ng-token-auth', ])

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

  ])


