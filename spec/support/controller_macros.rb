module ControllerMacros

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in @user
    end
  end

  def can_manage_all
    before(:each) do
      @ability = Object.new
      @ability.extend(CanCan::Ability)
      allow(@controller).to receive(:current_ability).and_return(@ability)
      @ability.can :manage, :all
    end
  end


end