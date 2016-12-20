class BusinessesController < ApplicationController

  def new
    @business = Business.new
  end

  def create 
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        # upon successful, assign this business to logged in user
        current_user.business = @business

        format.html { redirect_to items_path, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

    # strong parameters to whitelist allowed parameters
    def business_params
      params.require(:business).permit(:name, :city, :address)
    end
  
end
