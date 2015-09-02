angular.module('app.services')
.factory 'AttachedFileService', ['Restangular',
  (Restangular)->
    getAttachedFilesByComment: (comment) -> Restangular.one("comments", comment.id).all("attached_files").getList()
]