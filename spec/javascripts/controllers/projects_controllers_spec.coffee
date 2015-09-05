
describe "ProjectsController", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($auth, $state, toaster, $rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('ProjectsController', $scope: scope)

  it "has new project method", ->
    expect(scope.newProject).toBeDefined()

  it "has remove project method", ->
    expect(scope.removeProject).toBeDefined()

  it "has sortableOptions", ->
    expect(scope.sortableOptions).toBeDefined()
