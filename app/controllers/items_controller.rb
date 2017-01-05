class ItemsController < ApplicationController
  before_action :prepare_item, only: [:show, :edit, :update, :destroy]
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
    @item = Item.new item_params
    if @item.save
      flash[:success] = 'Task successfully created.'
      redirect_to items_path
    else
      flash[:errors] = @item.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update item_params
      flash[:success] = 'item successfully updated.'
      redirect_to items_path
    else
      flash[:errors] = @item.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @item.destroy
      flash[:success] = 'Item successfully deleted.'
    else
      flash[:errors] = @item.errors.full_messages
    end

    redirect_to items_path
  end

  private
    def item_params
      params.require(:item).permit(:name, :price, :business_id)
    end

    def prepare_item
      @item = Item.find_by id: params[:id]
      unless @item
        flash[:error] = "No Item"
        redirect_to items_path
      end
    end
end
