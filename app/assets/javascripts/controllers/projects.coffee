angular.module('app.controllers')
  .controller 'ProjectsController', ['$scope', '$auth', '$state', 'toaster', 'ProjectService',
    ($scope, $auth, $state, toaster, ProjectService) ->

      updateProjects = ->
        $scope.projects = ProjectService.getProjects().$object

      $scope.new_project = ->
        $state.go 'new_project'

      $scope.removeProject = (project) ->
        project.remove().then(
          ->
            toaster.success "The project has been successfully removed."
            _.remove($scope.projects, (p) -> p == project)
        )

      $scope.sortableOptions =
        opacity: 0.7
        delay: 150

        stop: (e, ui) ->
          _.map($scope.projects, (project, index) ->
            project.position = index
            project.patch()
          )
        axis: 'y'

      updateProjects()
  ]