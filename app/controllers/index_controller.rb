class IndexController < ApplicationController
	layout 'main'
	def content
		@news = News.order("created_at DESC");
		@images = Item.get_images_for_index;
		@last_items = Item.limit(4).order("created_at DESC");
	end
end
