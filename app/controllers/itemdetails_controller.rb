class ItemdetailsController < ApplicationController
	layout 'main'

	def index
		@item = Item.find(params[:id])
	end
end
