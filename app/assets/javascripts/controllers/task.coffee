angular.module('app.controllers')
  .controller 'TaskController', ['$scope', 'CommentService', 'TaskService',
    ($scope, CommentService, TaskService) ->

      # Init comments
      $scope.comments = $scope.task.comments

      $scope.updateComments = ->
        $scope.comments = CommentService.getCommentsByTask($scope.task).$object

      $scope.save = ->
        TaskService.updateTask($scope.task)

      $scope.saveComment = (comment)->
        CommentService.updateComment(comment)

      $scope.toggleTaskStatus = (task) ->
        task.done = !task.done
        TaskService.updateTask(task)

      $scope.removeComment = (comment) ->
        CommentService.removeComment(comment).then( -> _.remove($scope.comments, (c)-> c == comment ))

  ]