
describe "SignUpController", ->
  scope = {}

  beforeEach(module('app'))
  beforeEach ->
    inject ($rootScope, $controller)->
      scope = $rootScope.$new()

      ctrl = $controller('SignUpController', $scope: scope)

  it "has sign up method", ->
    expect(scope.signUp).toBeDefined()
