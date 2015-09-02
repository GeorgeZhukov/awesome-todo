angular.module('app.services')
.factory 'ProjectService', ['Restangular',
  (Restangular)->
    getProjects: -> Restangular.all('projects').getList()

]