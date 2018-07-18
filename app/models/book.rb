class Book < ApplicationRecord

  belongs_to :author
  has_many :reviews
  has_many :users, through: :reviews

  validates_presence_of :title, :year, :image

  def self.alpha_order
    order('title ASC')
  end

end
