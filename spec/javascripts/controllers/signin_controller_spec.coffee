
describe "SignInController", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($auth, $state, toaster, $rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('SignInController', $scope: scope)

  it "has login", ->
    expect(scope.login).toBeDefined()
