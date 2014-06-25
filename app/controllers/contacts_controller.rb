class ContactsController < ApplicationController
	layout 'main'
	def index
		@contacts = Contact.first();
		@friends = Friend.all;
	end
end
