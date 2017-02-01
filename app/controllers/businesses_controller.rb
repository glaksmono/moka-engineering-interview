class BusinessesController < ApplicationController
  before_action :check_business, only: [:index, :new]

  def index
    render 'new'
  end

  def new
  end

  def create
    @business = Business.new(business_param)
    @business[:user_id] = current_user.id
    @business.save
    redirect_to root_url
  end

  def update
    @business = Business.update(params[:id], business_param)  
    redirect_to root_url
  end 
  
  private
    def business_param
      params.require(:business).permit(:name, :address, :city)
    end

    def check_business
      @business = Business.where(user_id: @current_user.id)
      if @business.size == 0
        @business = Business.new
      else 
        @business = @business.first
      end
    end

end
