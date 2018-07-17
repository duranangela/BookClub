class Book < ApplicationRecord

  belongs_to :author

  validates_presence_of :title, :year, :image

  def self.alpha_order
    order('title ASC')
  end

end
