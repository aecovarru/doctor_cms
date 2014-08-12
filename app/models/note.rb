class Note < ActiveRecord::Base

	belongs_to :account

	scope :sorted, lambda { order("notes.created_at ASC") }
end
