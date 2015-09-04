angular.module('app.controllers')
  .controller 'ProjectController', ['$scope', '$state', 'toaster', 'TaskService',
    ($scope, $state, toaster, TaskService) ->

      # Init tasks
      $scope.tasks = $scope.project.tasks

      updateTasks = ->
        $scope.tasks = TaskService.getTasksByProject($scope.project).$object

      $scope.addTask = ->
        TaskService.addTaskToProject($scope.project, $scope.newTask).then(updateTasks)
        $scope.newTask = {}

      $scope.removeTask = (task) ->
        TaskService.removeTask(task).then(
          -> _.remove($scope.tasks, (t)-> t == task)
        )

      $scope.save = ->
        $scope.project.patch()

      $scope.sortableOptions =
        connectWith: '.tasks'
        opacity: 0.7
        delay: 150

        stop: (e, ui) ->
          _.map($scope.tasks, (task, index) ->
            task.position = index
            TaskService.updateTask(task)
          )

        axis: 'y'

  ]