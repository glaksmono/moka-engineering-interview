class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]
  before_filter :set_user, only: [:edit, :update]

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

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to root_path and return false
    end
  end

  def user_params
    params.require(:user).permit(:email, :password,
                                 :password_confirmation,
                                 :first_name, :last_name)
  end
end
