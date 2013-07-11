class ItemdetailsController < ApplicationController
	layout 'items'

	def index
		@item = Item.find(params[:id])
	end
end
