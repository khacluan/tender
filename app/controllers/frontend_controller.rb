class FrontendController < ApplicationController
	layout 'frontend'
  def index
  	@groups = Group.order('priority asc').includes(:items => :friends)
  end

  def update_related_items

  	@item = Item.find_by_id(params[:id])
  	puts @item.inspect
  	@group = @item.group
  end


end