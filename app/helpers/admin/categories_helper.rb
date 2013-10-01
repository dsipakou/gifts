module Admin::CategoriesHelper
	def subcat_name(cat_id)
		Category.find(cat_id).name unless cat_id.nil?
	end

	def main_category_format(name)
		name.gsub(/\d/, '').strip
	end
end
