class Account < ActiveRecord::Base

	has_many :notes

	scope :sorted, lambda { order("if(name = '' or name is null,1,0),name ASC") }
end
