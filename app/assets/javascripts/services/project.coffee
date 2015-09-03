angular.module('app.services')
.factory 'ProjectService', ['Restangular',
  (Restangular)->
    getProjects: -> Restangular.all('projects').getList()
    addProject: (project) -> Restangular.all("projects").post(project)

]