
describe "ProjectController", ->
  scope = {}
  $httpBackend = null

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller, _$httpBackend_)->
      scope = $rootScope.$new()
      $httpBackend = _$httpBackend_

      scope.project = {
        tasks: []
      }

      ctrl = $controller('ProjectController', $scope: scope)

  it "has addTask method", ->
    expect(scope.addTask).toBeDefined()

  it "has removeTask method", ->
    expect(scope.removeTask).toBeDefined()

  it "has save method", ->
    expect(scope.save).toBeDefined()

  it "has sortableOptions", ->
    expect(scope.sortableOptions).toBeDefined()

  xdescribe ".save", ->
    beforeEach ->
      scope.project = {id: 1}

    it "sends PATCH request", ->
      $httpBackend.expectPATCH("/api/v1/projects/1.json")
      scope.save()

  describe ".removeTask", ->
    it "calls TaskService.removeTask", ->
      task = {id: 1}
      $httpBackend.expectDELETE("/api/v1/tasks/1.json")
      scope.removeTask(task)

  xdescribe ".addTask", ->
    beforeEach ->
      scope.newTask = {title: "Task 1"}

    it "calls TaskService.addTaskToProject", ->
      scope.project = {id: 1, title: "Project 1"}
      $httpBackend.expectPOST("/api/v1/projects/1/tasks.json")
      scope.addTask()