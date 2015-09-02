angular.module('app.services')
.factory 'TaskService', ['Restangular',
  (Restangular)->
    addTaskToProject: (project, task) -> project.all("tasks").post(task)
    getTasksByProject: (project) -> project.all('tasks').getList()
    removeTask: (task) -> Restangular.one('tasks', task.id).remove()
    updateTask: (task) -> Restangular.one("tasks", task.id).patch(task)
]