class Comment < ActiveRecord::Base
  include Voteable
	belongs_to :user
	belongs_to :post

  validates :content, presence: true
end