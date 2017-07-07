class User < ActiveRecord::Base

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	has_many :videos, dependent: :destroy
	belongs_to :subscriptions
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
	# validates :username, presence: true, length: { maximum: 20 }
	# validates :first_name, presence: true, length: { maximum: 20 }
	# validates :last_name, presence: true, length: { maximum: 20 }
end
