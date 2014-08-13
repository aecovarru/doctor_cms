class AdminUser < ActiveRecord::Base
	has_secure_password

	scope :sorted, lambda { order("last_name ASC, first_name ASC") }

	def name
		"#{first_name} #{last_name}"
	end
end
