class BusinessesController < ApplicationController

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    if @business.save
      redirect_to current_user, notice: "Business #{@business.name} has been created"
    else
      render 'new'
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      redirect_to current_user, notice: "Business #{@business.name} has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @business = Business.find_by(id: params[:id])
    if @business.try(:destroy)
      redirect_to current_user, notice: "Business #{@business.name} deleted"
    else
      redirect_to current_user, alert: "Failed to delete Business"
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :city)
  end

end
