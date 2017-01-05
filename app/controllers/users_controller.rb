class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  def show
     @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = 'Task successfully created.'
      redirect_to login_path
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update user_params
      flash[:success] = 'user successfully updated.'
      redirect_to users_path
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, business_attributes: [:name, :address, :city])  
  end
end
