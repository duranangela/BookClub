class Author < ApplicationRecord

  has_many :books, dependent: :destroy

  validates_presence_of :name

  def self.alpha_order
    order('name ASC')
  end

  def name_switch
    name.split(',').rotate(1).join(' ')
  end

end
