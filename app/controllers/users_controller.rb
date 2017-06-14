class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params(params))

    if @user.save
      redirect_to "/", notice: 'Sign Up was successful!! Please login to continue...'
    else
      flash.now[:alert] = 'Sign Up failed. Please try again.'
      render 'new'
    end
  end

  def update
    if @user.update_attributes(user_params(params))
      redirect_to "/", notice: "Profile has been updated."
    else
      render "edit"
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params(params)
      params.require(:user).permit(:email, :current_password, :password, :password_confirmation, :first_name, :last_name)
    end
end
