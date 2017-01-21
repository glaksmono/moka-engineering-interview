class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  def show
     @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    email_not_validate = unvalidation_email(user_params[:email])
    pass_not_validate = unvalidation_password(user_params[:password], user_params[:password_confirmation])
    if !email_not_validate && !pass_not_validate
      if User.create(user_params)
        redirect_to root_path, notice: 'you are signed, welcome back'
      else
        redirect_to new_user_path
      end
    else
      alert = ''
      if email_not_validate == true
        alert = "email has already"
      else 
        alert = "wrong password confirmation" 
      end
      redirect_to new_user_path, alert: alert
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
 
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: "Profile has ben saved"
    else
      render 'edit'
    end
  end

  def unvalidation_email(email)
    unless User.find_by_email(email).nil?
      return true
    end
  end
  def unvalidation_password(password, password_confirmation)
    if password != password_confirmation
      return true
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)  
    end
end
