class User < ActiveRecord::Base
	has_many :posts

	has_many :comments

  has_secure_password validations: false


  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  validate :check_username

  def check_username
    #errors.add(:base, 'Must be friends to leave a comment')
  end
end