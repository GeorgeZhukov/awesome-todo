
describe "ProjectsController", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('ProjectsController', $scope: scope)

  it "has new project method", ->
    expect(scope.new_project).toBeDefined()

  it "has remove project method", ->
    expect(scope.removeProject).toBeDefined()

  it "has sortableOptions", ->
    expect(scope.sortableOptions).toBeDefined()
