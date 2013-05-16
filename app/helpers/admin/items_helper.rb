module Admin::ItemsHelper

	def categories
		Category.all.map { |cat| [cat.name, cat.id]}
	end

	def category(id)
		Category.find(id).name
	end

	def items_on_the_page_label(total)
		label = if params[:page]
			((Integer(params[:page]) - 1) * 5 + 1).to_s
		else
			"1"
		end
		label += " - "
		label += if params[:page]
			if Integer(params[:page]) * 5 > total
				total.to_s
			else
				(Integer(params[:page]) * 5).to_s
			end
		else
			if total > 5
				"5"
			else
				total.to_s
			end
		end
		label
	end
end
