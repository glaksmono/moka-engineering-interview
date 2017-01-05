class BusinessesController < ApplicationController
  def new
    if current_user.business.present?
      redirect_to root_path
    else
      @business = current_user.build_business
      render :new
    end
  end

  def create
    @business = current_user.build_business(business_params)
    if @business.save
      redirect_to items_path, notice: 'Business was successfully created.'
    else
      render :new
    end
  end

  private
  def business_params
    params.require(:business).permit(:name, :address, :city)
  end
end
