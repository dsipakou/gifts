class ContactsController < ApplicationController
	layout 'main'
	def index
		@contacts = Contact.first();
	end
end
