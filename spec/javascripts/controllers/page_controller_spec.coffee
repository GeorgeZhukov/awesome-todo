
describe "PageCtrl", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($auth, $state, toaster, $rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('PageCtrl', $scope: scope)

  it "has projects", ->
#    expect(scope.projects).toBeDefined()
