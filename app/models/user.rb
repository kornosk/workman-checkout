class User < ApplicationRecord
	has_many :working_dates, dependent: :destroy
	has_many :absences, dependent: :destroy
	has_one :position
	
	validates :name, presence: true, length: { maximum: 150 }
end
