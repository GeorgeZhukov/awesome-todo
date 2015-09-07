
describe "NewProjectController", ->
  scope = {}
  $httpBackend = null

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller, _$httpBackend_)->
      $httpBackend = _$httpBackend_
      scope = $rootScope.$new()

      ctrl = $controller('NewProjectController', $scope: scope)

  it "has create method", ->
    expect(scope.create).toBeDefined()

  describe ".create", ->
    it "calls ProjectService.addProject", ->
      $httpBackend.expectPOST("/api/v1/projects.json")
      scope.create()
