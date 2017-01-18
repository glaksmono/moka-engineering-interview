class HomeController < ApplicationController
  def index
    # check if user logged in, if not redirect to login page
    if current_user.present?
      redirect_to current_user, notice: "Welcome back #{current_user.first_name} #{current_user.last_name}"
    else
      redirect_to login_path
    end
  end

end
