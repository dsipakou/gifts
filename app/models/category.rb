class Category < ActiveRecord::Base
	attr_accessible :name, :desc

	has_many :items, :dependent => :destroy

	validates_presence_of :name
end
