class BusinessesController < ApplicationController
  before_action :set_business, only: [:edit, :update]

  # GET /businesses/new
  def new
    if (current_user.business)
      redirect_to items_url, notice: 'You already have one business.'
    else
      @business = Business.new
    end
  end

  # GET /businesses/1/edit
  def edit
    set_business
  end

  # POST /businesses
  def create
    if (business_params[:name] && business_params[:city] && business_params[:address])
      @business = Business.new(business_params)
      @business.user_id = current_user.id

      if @business.save
        redirect_to "/items", notice: 'Business was successfully created.'
      else
        render :new
      end
    else
      redirect_to new_business_url, notice: 'Name or city or address is required.'      
    end
  end

  # PATCH/PUT /businesses/1
  def update
    if @business.update(business_params)
      redirect_to "/items", notice: 'Business was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def business_params
      params.require(:business).permit(:name, :address, :city)
    end
end
