class Book < ApplicationRecord

  belongs_to :author
  has_many :reviews
  has_many :users, through: :reviews

  validates_presence_of :title, :year, :image

  def self.alpha_order
    order('title ASC')
  end

  def avg_rating
    reviews.average(:rating)
  end

  def order_reviews
    reviews.order('created_at DESC')
  end
end
