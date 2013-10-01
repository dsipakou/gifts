module CatalogHelper
	def get_subcat(main_category)
		Category.subcat(main_category)
	end
end
