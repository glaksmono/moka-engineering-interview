class BusinessesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @business = Business.new
  end

  def edit
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user

    if @business.save
      redirect_to "/", notice: 'Business was created successfully!!'
    else
      flash.now[:alert] = 'Could not create business. Please try again.'
      render 'new'
    end
  end

  def update
  end

  def delete
  end

  def business_params
    params.require(:business).permit(:name, :address, :city)
  end
end
