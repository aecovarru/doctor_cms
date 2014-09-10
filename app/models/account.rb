class Account < ActiveRecord::Base

	has_many :notes

	scope :sorted, lambda { order("NULLIF(name, '') ASC NULLS LAST") }
end
