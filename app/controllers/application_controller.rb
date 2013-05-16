class ApplicationController < ActionController::Base
	protect_from_forgery

	layout :layout_by_resource

	helper_method :contacts, :all_news

	# Used in header contacts
	def contacts
		@contact = Contact.first();
	end

	def all_news
		@all_news = News.all;
	end

	def after_sign_out_path_out(resource)
		login_path
	end

	def after_sign_in_path_for(resource)
		items_path
	end

	def layout_by_resource
		"login" if devise_controller?
	end

	private :after_sign_out_path_out, :after_sign_in_path_for
	protected :layout_by_resource

end