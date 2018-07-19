class Review < ApplicationRecord

  belongs_to :book
  belongs_to :user

  validates_presence_of :rating, :comment

  def time
    created_at.strftime('%b %d, %Y')
  end
end
