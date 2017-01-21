class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to root_path, notice: "Business #{@business.name} has ben Created"
    else
      render 'new'
    end
  end

  private
    def business_params
      params.require(:business).permit(:name, :address, :city, :user_id)
    end

end
