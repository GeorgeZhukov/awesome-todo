
describe "NewProjectController", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('NewProjectController', $scope: scope)

  it "has create method", ->
    expect(scope.create).toBeDefined()
