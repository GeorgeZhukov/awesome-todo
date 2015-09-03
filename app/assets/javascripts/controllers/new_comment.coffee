angular.module('app.controllers')
  .controller 'NewCommentController', ['$scope', 'FileUploader', 'Restangular',
    ($scope, FileUploader, Restangular)->
      $scope.uploader = new FileUploader(
        queueLimit: 3
      )

      $scope.create = ->

        Restangular.one("tasks", $scope.task.id).all("comments").post($scope.newComment).then(
          (comment)->

            # Set upload url
            _.map($scope.uploader.queue,
              (item)->item.url="/comments/" + comment.id + "/attached_files.json"
            )

            $scope.uploader.uploadAll()
            $scope.$parent.updateComments()
        )
        $scope.newComment = {}
  ]