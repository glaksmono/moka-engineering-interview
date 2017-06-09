class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

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

  def edit
  end

  def create
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    @item = Item.new(item_params(params))
    @item.business = current_business

    if @item.save
      redirect_to "/", notice: 'Item was created successfully!!'
    else
      flash.now[:alert] = 'Could not create item. Please try again.'
      render 'new'
    end
  end

  def update
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    if @item.update_attributes(item_params(params))
      redirect_to "/", notice: "Item has been updated."
    else
      render "edit"
    end
  end

  def destroy
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    if @item.destroy
      redirect_to "/", notice: 'Item was deleted successfully'
    else
      redirect_to "/", alert: 'Item could not be deleted'
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params(params)
      params.require(:item).permit(:name, :price)
    end
end
