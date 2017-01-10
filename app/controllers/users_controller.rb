class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]
  before_action :prepare_user, only: [:edit]

  def show
     @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
	@user = User.new user	
  	if @user.save
      redirect_to login_path, :notice => "User '#{@user.first_name} #{@user.last_name}' has been created successfully!"
    else
      render :new, :alert => "Unable to create item '#{@user.first_name} #{@user.last_name}'. Error : '#{@user.errors.full_messages}'"
    end
  end

   def update
    @user = current_user
    if @user.update user
        redirect_to items_path, :notice => "User '#{@user.first_name} #{@user.last_name}' has been updated successfully!"
    else
       render :new, :alert => "Unable to update user '#{@user.first_name} #{@user.last_name}'. Error : '#{@user.errors.full_messages}'"
    end
  end

  private
  def user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, business_attributes: [:name, :address, :city])  
  end

  def prepare_user
    @user = User.find_by id: params[:id]
  end
end
