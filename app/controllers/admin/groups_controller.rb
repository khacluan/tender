class Admin::GroupsController < ApplicationController

  def index
  	@groups = Group.all
  end

  def new
  	@group = Group.new
  end

  def create
  	@group = Group.create(params[:group])
  	redirect_to action: :index
  end

  def update
    @group = Group.find_by_id(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def edit
    @group = Group.find_by_id(params[:id])
  end

  def destroy
     @group = Group.find_by_id(params[:id])
     @group.destroy
     redirect_to action: :index
  end

end
