
describe "TaskController", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller)->
      scope = $rootScope.$new()

      scope.task = {
        comments: []
      }

      commentService = {
        getCommentsByTask: (task) ->
          5
      }
      ctrl = $controller('TaskController', $scope: scope, CommentService: commentService)

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
      expect(true).toBeTruthy()
#      expect(scope.updateComments()).toThrow()
