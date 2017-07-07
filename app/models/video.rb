class Video < ActiveRecord::Base

	belongs_to :categories
	belongs_to :users
	validates :category_id, presence: true
	validates :title, presence: true, length: {maximum: 255}
	validates :video_url, presence: true
end
