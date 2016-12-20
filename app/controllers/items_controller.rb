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
    @item = current_business.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Item was successfully added.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit 
    @item = Item.find(params[:id])
  end

  def update
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # TODO: [MOKA-001] Finish the implementation of Create/Update/Delete for Items
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_path, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private 

    # strong parameters to whitelist allowed parameters
    def item_params 
      params.require(:item).permit(:name, :price)
    end
end
