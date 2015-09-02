angular.module('app.controllers')
  .controller 'NewProjectController', ['$scope', 'Restangular', '$state', 'toaster',
    ($scope, Restangular, $state, toaster) ->
      $scope.create = ->
        Restangular.service('projects').post($scope.project).then(
          ->
            toaster.success "The project has been successfully created."
            $state.go 'projects'
        )
  ]