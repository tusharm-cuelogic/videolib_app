class Subscription < ActiveRecord::Base

	has_many :users
	validates :plan_code, presence: true, length: { maximum: 20 }
	validates :no_of_videos, presence: true, numericality: { only_integer: true }
	validates :expiry_in_days, presence: true, numericality: { only_integer: true }
	validates :cost, presence: true, numericality: { only_integer: true }
end
