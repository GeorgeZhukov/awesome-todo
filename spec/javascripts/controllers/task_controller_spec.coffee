
xdescribe "TaskController", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($auth, $state, toaster, $rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('TaskController', $scope: scope)

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
