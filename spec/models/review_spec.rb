require 'rails_helper'

describe Review, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:rating)}
    it {should validate_presence_of(:comment)}
  end
  describe 'relationships' do
    it {should belong_to(:book)}
    it {should belong_to(:user)}
  end
end
