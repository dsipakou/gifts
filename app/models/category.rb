class Category < ActiveRecord::Base
	attr_accessible :name, :desc, :subcategory

	has_many :items, :dependent => :destroy

	validates_presence_of :name

	def self.subcat(main_cat)
		Category.where("subcategory = '#{main_cat}'").order("name")
	end

	def self.get_main_categories(current_category)
		current_category ||= 0
		Category.where("subcategory is null AND id <> #{current_category}").order("name")
	end

	def self.get_subcategories
		Category.where("subcategory is not null").order("name")
	end

	def self.set_subcat_to_null(main_cat)
		Category.where("subcategory = #{main_cat}").each do |c|
			c.update_attribute(:subcategory, nil)
		end
	end
end