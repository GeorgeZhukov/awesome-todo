angular.module('app.controllers')
  .controller 'NewProjectController', ['$scope', '$state', 'toaster', 'ProjectService',
    ($scope, $state, toaster, ProjectService) ->
      $scope.create = ->
        ProjectService.addProject($scope.project).then(
          ->
            toaster.success "The project has been successfully created."
            $state.go 'projects'
        )
  ]