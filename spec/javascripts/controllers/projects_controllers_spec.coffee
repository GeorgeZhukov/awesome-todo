
describe "ProjectsCtrl", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($auth, $state, toaster, $rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('ProjectsCtrl', $scope: scope)

  it "has projects", ->
#    expect(scope.projects).toBeDefined()
