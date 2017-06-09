class BusinessesController < ApplicationController
  before_action :set_business, only: [:edit, :update]

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
    @business = Business.new(business_params(params))
    @business.user = current_user

    if @business.save
      redirect_to "/", notice: 'Business was created successfully!!'
    else
      flash.now[:alert] = 'Could not create business. Please try again.'
      render 'new'
    end
  end

  def update
    if @business.update_attributes(business_params(params))
      redirect_to "/", notice: "Business has been updated."
    else
      render "edit"
    end
end

  def delete
  end

  private
    def set_business
      @business = Business.find(params[:id])
    end

    def business_params(params)
      params.require(:business).permit(:name, :address, :city)
    end
end
