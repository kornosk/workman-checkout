class User < ApplicationRecord
	
	
	has_many :working_dates, dependent: :destroy
	has_many :absences, dependent: :destroy
	belongs_to :position
	
	validates :name, presence: true, length: { maximum: 150 }
end