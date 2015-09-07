
describe "NewCommentController", ->
  scope = {}
  $httpBackend= null

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller, _$httpBackend_)->
      $httpBackend = _$httpBackend_
      scope = $rootScope.$new()

      ctrl = $controller('NewCommentController', $scope: scope)

  it "has uploader", ->
    expect(scope.uploader).toBeDefined()

  it "has create method", ->
    expect(scope.create).toBeDefined()

  describe ".create", ->

    beforeEach ->
      scope.task = {id: 1}

    it "calls CommentService.addCommentToTask", ->
      scope.$parent.updateComments = -> null
      $httpBackend.expectPOST("/api/v1/tasks/1/comments.json")
      scope.create()

    it "clear newComment", ->
      scope.newComment = {text: "something here"}
      scope.create()
      expect(scope.newComment).toEqual({})
