angular.module('app.controllers')
  .controller 'TaskController', ['$scope', '$state', 'Restangular',
    ($scope, $state, Restangular) ->
      updateComments = ->
        $scope.task.all('comments').getList().then(
          (comments)->
            _.map(comments,
              (comment)->
                comment.attached_files = Restangular.one('comments', comment.id).all('attached_files').getList().$object
            )
            $scope.comments = comments
        )
      #$scope.comments = Restangular.one('tasks', $scope.task.id).all('comments').getList().$object


      $scope.addComment = ->
        $scope.task.all('comments').post($scope.newComment).then(updateComments)

      $scope.removeComment = (comment) ->
        comment.remove().then(updateComments)

      updateComments()
  ]