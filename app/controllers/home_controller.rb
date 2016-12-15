class HomeController < ApplicationController
  def index

  end

  def signup
    @user = User.new
    # TODO: [MOKA-002] Finish the implementation of User registration
  end
end
