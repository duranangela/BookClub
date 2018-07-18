class User < ApplicationRecord

  has_many :reviews
  has_many :books, through: :reviews

  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password

  enum role: ['default', 'admin']

  def order_reviews
    reviews.order('created_at DESC')
  end
end
