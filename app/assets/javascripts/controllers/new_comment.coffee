angular.module('app.controllers')
  .controller 'NewCommentController', ['$scope', 'FileUploader', 'Restangular',
    ($scope, FileUploader, Restangular)->
      $scope.uploader = new FileUploader(
        queueLimit: 3
        onCompleteAll: ->
          $scope.$parent.updateComments()
      )

      $scope.create = ->

        Restangular.one("tasks", $scope.task.id).all("comments").post($scope.newComment).then(
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