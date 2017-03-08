class Absence < ApplicationRecord
	belongs_to :user

	validates :remark, presence: true
	validates :start, presence: true
	validates :end, presence: true
end
