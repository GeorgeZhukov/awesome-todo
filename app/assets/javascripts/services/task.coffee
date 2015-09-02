angular.module('app.services')
.factory 'TaskService', ['Restangular',
  (Restangular)->
    addTask: (task) -> Restangular.service('tasks').post(task)
    getTasksByProject: (project) -> project.all('tasks').getList()
    removeTask: (task) -> Restangular.one('tasks', task.id).remove()
    updateTask: (task) -> Restangular.service('tasks').patch(task)
]