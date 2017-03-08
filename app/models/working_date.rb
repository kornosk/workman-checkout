class WorkingDate < ApplicationRecord
	belongs_to :user, dependent: :destroy
	
	validates :start, presence: true
end
