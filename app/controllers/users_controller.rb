class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  # GET /users/1
  def show
    set_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    set_user
  end

  # POST /users
  def create
    if (user_params[:password] == user_params[:password_confirmation])
      @user = User.new(user_params)

      if @user.save
        redirect_to "/login", notice: 'User was successfully created.'
      else
        render :new
      end
    else
      redirect_to "/signup", notice: 'Password don\'t match!'
    end
  end

  # PATCH/PUT /users/1
  def update
    if (user_params[:password] == user_params[:password_confirmation])
      if @user.update(user_params)
        redirect_to @items, notice: 'User was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to :back, notice: 'Password don\'t match!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
