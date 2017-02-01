class ItemsController < ApplicationController

  def index
    # List all of the Items that are owned by the logged in User's Business
    if current_business.present?
      @items = Item.where(business_id: current_business.id).order(id: :desc) 
    else
    # If business not yet created, redirect to create a new business
      redirect_to new_business_path, notice: "Please create a business."
    end
    @item = Item.new   
    respond_to do |format|
      format.html   
      format.js
    end 
  end

  def create
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    @item = Item.create(item_param)
    @item[:business_id] = current_business.id
    @item.save
    render json: @item, status: :created
  end

  def update
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items

    @item = Item.update(params[:id],item_param)
    render json: @item, status: :ok
  end


  def destroy
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    @item = Item.find(params[:id])
    @item.destroy

    render json: @item, status: :ok
  end

  private
    def item_param
      params.require(:item).permit(:name,:price)
    end 
end
