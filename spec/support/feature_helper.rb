module FeatureHelper
  def login(user=nil)
    user ||= FactoryGirl.create :user

    visit '/#/sign-in'
    within "#sign-in-form" do
      fill_in "E-mail", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign In"
    end
  end
end