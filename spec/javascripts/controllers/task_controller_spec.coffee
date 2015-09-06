
describe "TaskController", ->
  scope = {}
  $httpBackend = null

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller, _$httpBackend_)->
      $httpBackend = _$httpBackend_
      scope = $rootScope.$new()

      scope.task = {
        id: 1,
        title: "Task 1",
        comments: []
      }

      ctrl = $controller('TaskController', $scope: scope)

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  it "has updateComments method", ->
    expect(scope.updateComments).toBeDefined()

  it "has save method", ->
    expect(scope.save).toBeDefined()

  it "has saveComment method", ->
    expect(scope.saveComment).toBeDefined()

  it "has toggleTaskStatus method", ->
    expect(scope.toggleTaskStatus).toBeDefined()

  it "has removeComment method", ->
    expect(scope.removeComment).toBeDefined()

  describe ".updateComments", ->
    it "calls CommentService.getCommentsByTask", ->
      comments = [
        {
          id: 1,
          text: "comment 1",
          attached_files: []
        }
      ]
      $httpBackend.whenGET("/api/v1/tasks/1/comments.json").respond(comments)
      scope.updateComments()
      $httpBackend.flush()
      expect(scope.comments[0].text).toEqual("comment 1")

  describe ".save", ->
    it "calls TaskService.updateTask", ->
      task = {
        id: 1,
        title: "Task 2",
        comments: []
      }
      $httpBackend.whenPATCH("/api/v1/tasks/1.json").respond(task)
      scope.save()
      $httpBackend.flush()

  describe ".saveComment", ->
    it "calls CommentService.updateComment", ->
      comment = {
        id: 1,
        text: "comment 1",
        attached_files: []
      }
      $httpBackend.whenPATCH("/api/v1/comments/1.json").respond({})
      scope.saveComment(comment)
      $httpBackend.flush()

  describe ".toggleTaskStatus", ->
    it "changes done flag", ->
      task = {
        id: 1,
        title: "Task 2",
        done: false,
        comments: []
      }
      $httpBackend.whenPATCH("/api/v1/tasks/1.json").respond({})
      scope.toggleTaskStatus(task)
      $httpBackend.flush()
      expect(task.done).toBeTruthy()
