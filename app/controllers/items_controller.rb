class ItemsController < ApplicationController

  def index
    # List all of the Items that are owned by the logged in User's Business
    if current_business.present?
      @items = current_business.items
    else
    # If business not yet created, redirect to create a new business
      redirect_to new_business_path, notice: "Please create a business."
    end
  end

  def new
    @item = Item.new
  end

  def create
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: "Item #{@item.name} has ben Created"
    else
      render 'new'
    end
  end

  def edit 
    @item = Item.find(params[:id])
  end

  def update
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    @item = Item.find(params[:id])
 
    if @item.update(item_params)
      redirect_to edit_item_path(@item), notice: "Item has ben saved"
    else
      render 'edit'
    end
  end

  def destroy
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    @item = Item.find(params[:id])
    @item.destroy
  
    redirect_to items_path,notice: "Item has ben deleted"
  end

  private
    def item_params
      params.require(:item).permit(:name, :price, :business_id)
    end
end
