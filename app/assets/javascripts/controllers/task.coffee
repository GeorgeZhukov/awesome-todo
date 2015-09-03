angular.module('app.controllers')
  .controller 'TaskController', ['$scope', '$state', 'CommentService', 'AttachedFileService', 'Restangular',
    ($scope, $state, CommentService, AttachedFileService, Restangular) ->
      updateComments = ->
        CommentService.getCommentsByTask($scope.task).then(
          (comments)->
            _.map(comments,
              (comment)->
                comment.attached_files = AttachedFileService.getAttachedFilesByComment(comment).$object
            )
            $scope.comments = comments
        )

      $scope.save = ->
        Restangular.one("tasks", $scope.task.id).patch($scope.task)

      $scope.saveComment = (comment)->
        Restangular.one("comments", comment.id).patch(comment)

      $scope.addComment = ->
        Restangular.one("tasks", $scope.task.id).all("comments").post($scope.newComment).then(updateComments)
        $scope.newComment = {}

      $scope.removeComment = (comment) ->
        CommentService.removeComment(comment).then( -> _.remove($scope.comments, (c)-> c == comment ))

      updateComments()
  ]