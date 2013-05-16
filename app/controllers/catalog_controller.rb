class CatalogController < ApplicationController
	layout 'main'

	def index
		@categories = Category.all
		if params[:id]
			@cat_name = Category.find(params[:id]).name
			@items = Item.by_category(params[:id])
		else
			@items = Item.order("created_at DESC")
		end
		@cat_name ||= "All"
	end
end
