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
      log_in(@user)
      redirect_to items_path, notice: 'Welcome, your account has been created successfully.'
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password,
                                 :password_confirmation,
                                 :first_name, :last_name)
  end
end
