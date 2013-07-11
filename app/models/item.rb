require 'paperclip_processors/watermark'
class Item < ActiveRecord::Base

	attr_accessible :availability, :category_id, :picture1, :picture2, :picture3, :price, :title, :desc, :showonmain

	has_attached_file :picture1,
					processors: [:watermark],
					styles: {
						big: "500x500>",
						index: "450x230#",
						medium: "300x300#",
						catalog: "200x200#",
						small: "100x100#",
						},
					url: "/assets/products/:id/:style/:basename.:extension",
					path: ":rails_root/public/assets/products/:id/:style/:basename.:extension",
					default_url: "/assets/products/missing.png"

	has_attached_file :picture2,
					styles: {big: '500x500>', medium: "300x300#", small: "100x100#"},
					url: "/assets/products/:id/:style/:basename.:extension",
					path: ":rails_root/public/assets/products/:id/:style/:basename.:extension",
					default_url: "/assets/products/missing.png"

	has_attached_file :picture3,
					styles: {big: '500x500>', medium: "300x300#", small: "100x100#"},
					url: "/assets/products/:id/:style/:basename.:extension",
					path: ":rails_root/public/assets/products/:id/:style/:basename.:extension",
					default_url: "/assets/products/missing.png"


	validates_numericality_of :price, allow_nil: true
	validates :picture1, attachment_presence: true

	def self.by_category(id)
		Item.where("category_id = #{id}").order("created_at DESC")
	end

	def self.get_images_for_index
		Item.where("showonmain = true")
	end

	def self.desc_order
		Item.order("id DESC")
	end

end
