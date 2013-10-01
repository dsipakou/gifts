class ItemdetailsController < ApplicationController
	#layout 'items'
	layout 'items'

	def index
		@item = Item.find(params[:id])
		@similar_items = Item.similar_items(params[:id]);
	end
end
