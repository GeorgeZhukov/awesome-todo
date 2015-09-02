angular.module('app.controllers')
  .controller 'ProjectController', ['$scope', '$state', 'Restangular', 'toaster',
    ($scope, $state, Restangular, toaster) ->
      updateTasks = ->
        $scope.tasks = $scope.project.all('tasks').getList().$object

      $scope.addTask = ->
        $scope.project.all('tasks').post($scope.newTask).then(updateTasks)
        $scope.newTask = {}

      $scope.removeTask = (task) ->
        task.remove().then(updateTasks)

      updateTasks()

  ]