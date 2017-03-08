class Position < ApplicationRecord
	has_many :users

	validates :name, presence: true, length: { maximum: 100 }
	validates :description, presence: true, length: { maximum: 2500 }
end
