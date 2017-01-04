class BusinessesController < ApplicationController
  def new
    @business = current_business
  end
 
  def update
    @business = current_business
    if @business.update business_params
      flash[:success] = 'business successfully updated.'
      redirect_to items_path
    else
      flash[:errors] = @business.errors.full_messages
      render :edit
    end
  end

  private
  def business_params
    params.require(:business).permit(:name, :address, :city)  
  end
end
