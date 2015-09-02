angular.module('app.controllers')
  .controller 'TaskController', ['$scope', '$state', 'CommentService', 'AttachedFileService',
    ($scope, $state, CommentService, AttachedFileService) ->
      updateComments = ->
        CommentService.getCommentsByTask($scope.task).then(
          (comments)->
            _.map(comments,
              (comment)->
                comment.attached_files = AttachedFileService.getAttachedFilesByComment(comment).$object
            )
            $scope.comments = comments
        )

      $scope.addComment = ->
        $scope.newComment.task_id = $scope.task.id
        CommentService.addComment($scope.newComment).then(updateComments)
        $scope.newComment = {}

      $scope.removeComment = (comment) ->
        CommentService.removeComment(comment).then( -> _.remove($scope.comments, (c)-> c == comment ))

      updateComments()
  ]