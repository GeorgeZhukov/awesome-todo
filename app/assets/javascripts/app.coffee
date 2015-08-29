angular.module('app', ['templates', 'ui.router', 'ng-token-auth', 'toaster', ])

  .config([ '$authProvider',
    ($authProvider)->
      $authProvider.configure(
        apiUrl: ""
      )
  ])

  .config([ '$stateProvider', '$urlRouterProvider',
    ($stateProvider, $urlRouterProvider)->
      $urlRouterProvider.otherwise "/"

      $stateProvider
        .state 'signin',
          url: '/sign-in'
          templateUrl: 'signin.html'
          controller: 'signInCtrl'

        .state 'signup',
          url: '/sign-up',
          templateUrl: 'signup.html',
          controller: 'signUpCtrl'

        .state 'projects',
          url: '/projects',
          templateUrl: 'projects.html',
          controller: 'projectsCtrl',
          resolve:
            auth: ['$auth', ($auth)-> $auth.validateUser()]

  ])


