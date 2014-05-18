class Admin::ItemsController < ApplicationController
  
  def index
  	@items = Item.where("name LIKE ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @items}
    end
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.create(params[:item])
  	redirect_to action: :index
  end

  def update
    @item = Item.find_by_id(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def edit
    @item = Item.find_by_id(params[:id])
  end

  def destroy
     @item = Item.find_by_id(params[:id])
     @item.destroy
     redirect_to action: :index
  end

end
