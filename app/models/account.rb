class Account < ActiveRecord::Base
  attr_accessible :name, :password, :type
end
