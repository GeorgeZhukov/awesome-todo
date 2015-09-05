
describe "PageController", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('PageController', $scope: scope)

  it "has projects", ->
#    expect(scope.projects).toBeDefined()
