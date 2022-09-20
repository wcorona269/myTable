class Api::MenuItemsController < ApplicationController

	def index
		@menu_items = MenuItem.all
		render :index
	end

	def create
		@menu_item = MenuItem.create!
		
		if @menu_item.save
			render :show
		end
	end

	def show
		@menu_item = MenuItem.find(params[:id])
		render :show
	end

	private
	def menu_item_params
		params.require(:menu_item).permit(:rest_id, :item)
	end
end
