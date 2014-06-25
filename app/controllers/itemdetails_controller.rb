class ItemdetailsController < ApplicationController
	#layout 'items'
	layout 'items'

	def index
		add_breadcrumb I18n.t("breadcrumbs.catalog"), :catalog_path
		@item = Item.find(params[:id])
		add_breadcrumb Category.find(@item.category_id).name, "/catalog/#{Category.find(@item.category_id).id}"
		add_breadcrumb @item.title, params[:id] unless @item.title.empty?

		@similar_items = Item.similar_items(params[:id]);
	    respond_to do |format|
	    	format.html 
    		format.json { render json: @item }
    	end
	end

	
end
