class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  def show
     @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Redirect user to login page after signup
      redirect_to login_path, :notice => "Registration was successful."
    else
      render 'new'
    end
  end


  private 

    # strong parameters to whitelist allowed parameters
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
