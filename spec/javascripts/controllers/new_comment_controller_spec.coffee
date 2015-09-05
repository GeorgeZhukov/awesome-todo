
describe "NewCommentController", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('NewCommentController', $scope: scope)

  it "has uploader", ->
    expect(scope.uploader).toBeDefined()

  it "has create method", ->
    expect(scope.create).toBeDefined()
