class HomeController < ApplicationController
  def index
    redirect_to items_path
  end

  def signup
    @user = User.new
    # TODO: [MOKA-002] Finish the implementation of User registration
  end
end
