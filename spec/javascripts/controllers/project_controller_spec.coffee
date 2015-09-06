
describe "ProjectController", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller)->
      scope = $rootScope.$new()

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
