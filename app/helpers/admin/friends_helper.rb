module Admin::FriendsHelper
	def show_title(friend)
		unless friend.img.empty?
			link_to (image_tag friend.img, class: "image round", width: 80), friend.url
		else
			link_to friend.name, friend.url
		end
	end

	def show_desc(friend)
		unless friend.img.empty?
			link_to friend.desc, friend.url
		else
			friend.desc
		end
	end
end
