angular.module('app.controllers')
  .controller 'ProjectController', ['$scope', '$state', 'toaster','TaskService', 'Restangular',
    ($scope, $state, toaster, TaskService, Restangular) ->
      updateTasks = ->
        $scope.tasks = TaskService.getTasksByProject($scope.project).$object

      $scope.addTask = ->
        TaskService.addTaskToProject($scope.project, $scope.newTask).then(updateTasks)
        $scope.newTask = {}

      $scope.removeTask = (task) ->
        TaskService.removeTask(task).then(
          -> _.remove($scope.tasks, (t)-> t == task)
        )

      $scope.sortableOptions =
        connectWith: '.tasks'
        opacity: 0.7

        receive: (e, ui) ->
          task = ui.item.sortable.model
          task.project_id = $scope.project.id

        stop: (e, ui) ->
          _.map($scope.tasks, (task, index) ->
            task.position = index
            Restangular.one("tasks", task.id).patch(task)
          )

        update: (e, ui) ->

          _.map($scope.tasks, (task, index) ->
            task.position = index
            Restangular.one("tasks", task.id).patch(task)
          )

        axis: 'y'

      updateTasks()

  ]