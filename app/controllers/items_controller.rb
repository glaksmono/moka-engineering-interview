class ItemsController < ApplicationController

  def index
    # List all of the Items that are owned by the logged in User's Business
    if current_business.present?
      @items = current_business.items
    else
    # If business not yet created, redirect to create a new business
      redirect_to current_user
    end
  end

  def new
    @item = Item.new()
  end

  def create
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    @item = Item.new(item_params)
    @item.business = current_business
    if @item.save
      redirect_to items_path, notice: "Item #{@item.name} has been created"
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
    if @item.update_attributes(item_params)
      redirect_to items_path, notice: "Item #{@item.name} has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    @item = Item.find_by(id: params[:id])
    if @item.try(:destroy)
      redirect_to items_path, notice: "Item #{@item.name} deleted"
    else
      redirect_to items_path, alert: "Failed to delete Item"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
