angular.module('app.services')
.factory 'TaskService', ['Restangular',
  (Restangular)->
    addTaskToProject:
      (project, task) ->
        task_wrapper = {task: task}
        project.all("tasks").post(task_wrapper)

    getTasksByProject: (project) -> project.all('tasks').getList()
    removeTask: (task) -> Restangular.one('tasks', task.id).remove()
    updateTask: (task) ->
      task_wrapper = {task: task}
      Restangular.one("tasks", task.id).patch(task_wrapper)
]