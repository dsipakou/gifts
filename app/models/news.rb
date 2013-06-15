class News < ActiveRecord::Base
  attr_accessible :content, :date, :main

  def self.desc_sort
  	order("id DESC")
  end
end
