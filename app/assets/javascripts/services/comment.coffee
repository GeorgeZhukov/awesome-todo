angular.module('app.services')
.factory 'CommentService', ['Restangular',
  (Restangular)->
    addComment: (comment) -> Restangular.service('comments').post(comment)
    getCommentsByTask: (task) -> Restangular.one("tasks", task.id).all("comments").getList()
    removeComment: (comment) -> Restangular.one('comments', comment.id).remove()
    addCommentToTask: (task, comment) -> Restangular.one("tasks", task.id).all("comments").post(comment)
    updateComment: (comment) -> Restangular.one("comments", comment.id).patch(comment)
]