class Account < ActiveRecord::Base

	has_many :notes

	#Works for postgresql not mysql
	scope :sorted, lambda { order("NULLIF(accounts.name, '') ASC NULLS LAST, NULLIF(accounts.business, '') ASC NULLS LAST") }
	# scope :sorted, lambda { order("accounts.name ASC, accounts.business ASC") }
end
