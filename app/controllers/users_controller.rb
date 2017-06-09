class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params)

    if @user.save
      redirect_to "/", notice: 'Sign Up was successful!! Please login to continue...'
    else
      flash.now[:alert] = 'Sign Up failed. Please try again.'
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:email, :password_digest, :first_name, :last_name)
  end
end
