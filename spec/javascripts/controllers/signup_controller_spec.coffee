
describe "SignUpCtrl", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($auth, $state, toaster, $rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('SignUpCtrl', $scope: scope)

  it "has sign up method", ->
    expect(scope.signUp).toBeDefined()
