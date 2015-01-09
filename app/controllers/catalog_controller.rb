class CatalogController < ApplicationController
	

	layout 'main'

	def index
		@categories = Category.all
		if params[:id]
			add_breadcrumb I18n.t("breadcrumbs.catalog"), :catalog_path
			@cat_name = Category.find(params[:id]).name

			add_breadcrumb @cat_name, params[:id]
			@items = Item.by_category(params[:id])
		else
			@items = Item.order("created_at DESC").last(15)
		end
		@cat_name ||= "All"

		@main_categories = Category.get_main_categories(0)
		respond_to do |format|
	    	format.html 
    		format.json { render json: @items }
    	end
	end
end
