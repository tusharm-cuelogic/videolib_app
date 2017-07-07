class Category < ActiveRecord::Base

	has_many :videos, dependent: :destroy
	validates :name, presence: true, length: {maximum: 50}
	validates :description, presence: true, length: {maximum: 150}
	validates :code, presence: true, length: {maximum: 20}
end
