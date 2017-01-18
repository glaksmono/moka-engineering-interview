class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  def show
     @user = User.find(params[:id])
  end

  def new
    # TODO: [MOKA-002] Finish the implementation of User registration
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.business = current_business
    if @user.save
      log_in @user
      redirect_to root_url, notice: "Welcome #{@user.first_name} #{@user.last_name} to Moka Rails Interview"
    else
      render 'new'
    end
  end

  def edit
    # TODO: [MOKA-002] Finish the implementation of User registration
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, notice: "Your Profile has been updated"
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
