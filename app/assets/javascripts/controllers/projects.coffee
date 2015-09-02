angular.module('app.controllers')
  .controller 'ProjectsController', ['$scope', '$auth', '$state', 'Restangular', 'toaster', 'ProjectService',
    ($scope, $auth, $state, Restangular, toaster, ProjectService) ->

      updateProjects = ->
        $scope.projects = ProjectService.getProjects().$object

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