class Admin::AccountsController < ApplicationController
	layout 'login'

	def login
		if user_signed_in?
			redirect_to(items_path)
		else
			redirect_to(login_path)
		end
	end
	def create

	end
end
