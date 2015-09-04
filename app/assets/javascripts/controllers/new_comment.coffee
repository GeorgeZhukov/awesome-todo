angular.module('app.controllers')
  .controller 'NewCommentController', ['$scope', '$auth', 'FileUploader', 'CommentService',
    ($scope, $auth, FileUploader, CommentService)->
      $scope.uploader = new FileUploader(
        headers: $auth.retrieveData('auth_headers')
        queueLimit: 3
        onCompleteAll: ->
          $scope.uploader.clearQueue()
          $scope.$parent.updateComments()
      )

      $scope.create = ->
        CommentService.addCommentToTask($scope.task, $scope.newComment).then(
          (comment)->
            if _.size($scope.uploader.queue) == 0
              $scope.$parent.updateComments()
            else
              # Set upload url
              _.map($scope.uploader.queue,
                (item)->item.url="/comments/" + comment.id + "/attached_files.json"
              )

              $scope.uploader.uploadAll()

        )
        $scope.newComment = {}
  ]