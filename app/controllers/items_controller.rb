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
    @item = Item.new business_id: current_business.id
  end

  def create
    @item = Item.new item
    if @item.save
      redirect_to items_path, :notice => "Item '#{@item.name}' has been created successfully!"
    else
      redirect_to items_path, :alert => "Unable to create item '#{item.name}'. Error : '#{item.errors.full_messages}'"
      render :new
    end
  end

  def Update
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
  end

  def destroy
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
  end

   private
    def item
      params.require(:item).permit(:name, :price, :business_id)
    end
end
