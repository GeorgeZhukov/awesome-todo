
describe "SignInController", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('SignInController', $scope: scope)

  it "has login", ->
    expect(scope.login).toBeDefined()
