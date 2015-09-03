angular.module('app.controllers')
  .controller 'TaskController', ['$scope', '$state', 'CommentService', 'AttachedFileService', 'TaskService',
    ($scope, $state, CommentService, AttachedFileService, TaskService) ->
      $scope.updateComments = ->
        CommentService.getCommentsByTask($scope.task).then(
          (comments)->
            _.map(comments,
              (comment)->
                comment.attached_files = AttachedFileService.getAttachedFilesByComment(comment).$object
            )
            $scope.comments = comments
        )

      $scope.save = ->
        TaskService.updateTask($scope.task)

      $scope.saveComment = (comment)->
        CommentService.updateComment(comment)

      $scope.toggleTaskStatus = (task) ->
        task.done = !task.done
        TaskService.updateTask(task)

      $scope.removeComment = (comment) ->
        CommentService.removeComment(comment).then( -> _.remove($scope.comments, (c)-> c == comment ))

      $scope.updateComments()
  ]