class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

  validates :content, presence: true

  has_many :votes, as: :voteable, dependent: :delete_all

  def total_votes
    votes.where(vote: true).size - votes.where(vote: false).size
  end
end