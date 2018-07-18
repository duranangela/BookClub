class Review < ApplicationRecord

  belongs_to :book
  belongs_to :user

  validates_presence_of :rating, :comment

end
