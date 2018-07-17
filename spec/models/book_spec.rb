require 'rails_helper'

describe Book, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:year)}
    it {should validate_presence_of(:image)}
  end
  describe 'relationships' do
    it {should belong_to(:author)}
  end
end
