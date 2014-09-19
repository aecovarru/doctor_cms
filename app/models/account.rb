class Account < ActiveRecord::Base

	has_many :notes

	#Works for postgresql not mysql
	scope :sorted_name, lambda { order("NULLIF(accounts.name, '') ASC NULLS LAST, NULLIF(accounts.business, '') ASC NULLS LAST") }
	scope :sorted_business, lambda { order("NULLIF(accounts.business, '') ASC NULLS LAST, NULLIF(accounts.name, '') ASC NULLS LAST") }
end
