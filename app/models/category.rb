class Category < ActiveRecord::Base
	has_many :memberships
	has_many :posts, through: :memberships

  validates :name, presence: true
end