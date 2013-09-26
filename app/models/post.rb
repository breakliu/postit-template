class Post < ActiveRecord::Base
  include Voteable
  
	belongs_to :user

	has_many :comments

	has_many :memberships
	has_many :categories, through: :memberships

  

  validates :title, presence: true

  after_validation :slug_generate

  

  def slug_generate
    self.slug = self.title.gsub(' ', '-')
  end

  def to_param
    self.slug
  end
end