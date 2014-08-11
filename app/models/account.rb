class Account < ActiveRecord::Base
	scope :sorted, lambda { order("accounts.name ASC") }
	
end
