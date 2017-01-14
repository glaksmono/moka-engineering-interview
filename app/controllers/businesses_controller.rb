class BusinessesController < ApplicationController
	before_action :prepare_item, only: [:edit, :update]
	load_and_authorize_resource
	

	def new
		@business = Business.new user_id: current_user.id
	end

	def create
		if @business.save
			redirect_to items_path, :notice => "Business '#{@business.name}' has been created successfully!"
		else
			render :new, :alert => "Unable to create business '#{@business.name}'. Error : '#{@business.errors.full_messages}'"
		end
	end

	def update
		if Business.where(:id => params[:id]).present?
		      #If Business exist, business item
		      if @business.update business_params
		      	redirect_to items_path, :notice => "Business '#{@business.name}' has been updated successfully!"
		      else
		      	render :new, :alert => "Unable to update business '#{@business.name}'. Error : '#{@business.errors.full_messages}'"
		      end
  		else
		      #If business doesn't exist, prompt alert
		      redirect_to items_path :alert => "Business that was going to be updated is no longer exist. Please recreate new business!"
		end
	end

	private
	def business_params
		params.require(:business).permit(:name, :address, :city, :user_id)  
	end

	def prepare_item
		@business = Business.find_by id: params[:id]
	end
end
