class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  def show
     @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  	if User.where(:email =>  params[:email]).empty?
		@user = User.new user	
  	    if @user.save
	      redirect_to login_path, :notice => "User '#{@user.first_name} #{@user.last_name}' has been created successfully!"
	    else
	      render :new, :alert => "Unable to create item '#{@user.first_name}'. Error : '#{@user.errors.full_messages}'"
	    end
	else
		 redirect_to login_path, :alert => "User with email address is exists. Please enter different email address!"
	end
  end

  def user
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, business_attributes: [:name, :address, :city])  
  end
end
