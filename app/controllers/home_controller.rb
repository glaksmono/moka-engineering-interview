class HomeController < ApplicationController
  def index
    # check if user logged in, if not redirect to login page
    if current_user.present?
      redirect_to items_path
    else
      redirect_to login_path
    end
  end
end
