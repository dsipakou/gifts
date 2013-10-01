class Item < ActiveRecord::Base

	attr_accessible :availability, :category_id, :picture1, :picture2, :picture3, :price, :title, :desc, :showonmain, :article, :similar_to

	before_save :set_article

	has_attached_file :picture1,
					styles: {
						big: "700x700>",
						index: "450x230#",
						medium: "300x300#",
						catalog: "200x200#",
						small: "100x100#",
						},
					url: "/assets/products/:id/:style/:basename.:extension",
					path: ":rails_root/public/assets/products/:id/:style/:basename.:extension",
					default_url: "/assets/products/missing.png"

	has_attached_file :picture2,
					styles: {big: '700x700>', medium: "300x300#", small: "100x100#"},
					url: "/assets/products/:id/:style/:basename.:extension",
					path: ":rails_root/public/assets/products/:id/:style/:basename.:extension",
					default_url: "/assets/products/missing.png"

	has_attached_file :picture3,
					styles: {big: '700x700>', medium: "300x300#", small: "100x100#"},
					url: "/assets/products/:id/:style/:basename.:extension",
					path: ":rails_root/public/assets/products/:id/:style/:basename.:extension",
					default_url: "/assets/products/missing.png"


	validates_numericality_of :price, allow_nil: true
	validates_numericality_of :article, allow_nil: true
	validates_uniqueness_of :article
	validates :picture1, attachment_presence: true

	SIMILAR_LIMIT = 4

	def self.by_category(id)
		Item.where("category_id = #{id}").order("created_at DESC")
	end

	def self.get_images_for_index
		Item.where("showonmain = true")
	end

	def self.desc_order
		Item.order("id DESC")
	end

	def set_article
		self.article ||= Item.order("article DESC").first.article.to_i + 1;
	end

	def self.similar_items(id)
		items = Array.new
		similar_item = Item.where("id = " + id).first.similar_to
		similar_item = 0 if similar_item == "" || similar_item.nil?
		category = Item.where("id = " + id).first.category_id
		unless (similar_item == 0)
			items = Item.where("article = " + similar_item)
			items += Item.where("category_id = " + category.to_s + 
								" AND id <> " + id + 
								" AND article <> " + similar_item.to_s)
								.order("RAND()")
								.limit(3)
		else
			items = Item.where("category_id = " + category.to_s + " AND id <> " + id).limit(4)
		end
		if items.count < SIMILAR_LIMIT + 1
			items += Item.where("category_id <> " + category.to_s + 
								" AND id <> " + id + 
								" AND article <> " + similar_item.to_s)
								.order("RAND()")
								.limit(SIMILAR_LIMIT - items.count)
		end
		items.shuffle
	end
end
