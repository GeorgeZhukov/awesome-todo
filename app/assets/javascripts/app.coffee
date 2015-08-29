angular.module('app',['templates', 'ui.router', 'ng-token-auth', 'toaster', ])

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
        .state 'index',
          url: '/'
          templateUrl: 'index.html'
          controller: 'pageCtrl'

  ])


