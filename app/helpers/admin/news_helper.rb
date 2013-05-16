module Admin::NewsHelper
	def if_main_exists(main)
		return false if main
		all_news.each do |n|
			return true if n.main
		end
		return false
	end
end
