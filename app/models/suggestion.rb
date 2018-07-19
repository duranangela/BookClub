class Suggestion < ApplicationRecord

  belongs_to :user

  validates_presence_of :author, :title, :rating, :comment

end
