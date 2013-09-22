class Post < ActiveRecord::Base
	belongs_to :user

	has_many :comments

	has_many :memberships
	has_many :categories, through: :memberships

  has_many :votes, as: :voteable, dependent: :delete_all

  validates :title, presence: true

  def total_votes
    votes.where(vote: true).size - votes.where(vote: false).size
  end
end