class AboutController < ApplicationController
	layout 'main'
	def index
		@about = Contact.first();
	end
end
