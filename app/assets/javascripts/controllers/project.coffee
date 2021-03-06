angular.module('app.controllers')
  .controller 'ProjectController', ['$scope', '$state', '$filter', 'TaskService',
    ($scope, $state, $filter, TaskService) ->


      # Convert date string to date object
      _.map($scope.project.tasks, (task)->
        if task.deadline
          task.deadline = new Date(task.deadline)
      )

      # Init tasks
      $scope.tasks = $scope.project.tasks

      $scope.activated_task = null

      updateTasks = ->
        $scope.tasks = TaskService.getTasksByProject($scope.project).$object

      $scope.activateTask = (task) ->
        $scope.activated_task =
          if $scope.activated_task == task
            null
          else
            task

      $scope.addTask = ->
        TaskService.addTaskToProject($scope.project, $scope.newTask).then(updateTasks)
        $scope.newTask = {}

      $scope.removeTask = (task) ->
        TaskService.removeTask(task).then(
          -> _.remove($scope.tasks, (t)-> t == task)
        )

      $scope.save = ->
        $scope.project.patch()

      saveTaskPositions = ->
        _.map($scope.tasks, (task, index) ->
          task.position = index
          TaskService.updateTask(task)
        )
        hasReceivedTask=no

      hasReceivedTask=no

      $scope.sortableOptions =
        connectWith: '.tasks'
        opacity: 0.7
        delay: 150

        receive: (e, ui) ->
          # Reassign task to another project
          receivedTask = ui.item.sortable.model
          receivedTask.project_id = $scope.project.id
          hasReceivedTask=yes

        update: (e, ui) ->
          if hasReceivedTask
            saveTaskPositions()

        stop: (e, ui) ->
          if !hasReceivedTask
            saveTaskPositions()


        axis: 'y'

  ]