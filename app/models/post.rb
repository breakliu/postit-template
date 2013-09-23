class Post < ActiveRecord::Base
	belongs_to :user

	has_many :comments

	has_many :memberships
	has_many :categories, through: :memberships

  has_many :votes, as: :voteable, dependent: :delete_all

  validates :title, presence: true

  after_validation :slug_generate

  def total_votes
    votes.where(vote: true).size - votes.where(vote: false).size
  end

  def slug_generate
    self.slug = self.title.gsub(' ', '-')
  end

  def to_param
    self.slug
  end
end