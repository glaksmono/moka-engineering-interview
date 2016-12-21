module ControllerMacros
  
  def login_user
    @user = FactoryGirl.create(:user)
    log_in @user
  end
end