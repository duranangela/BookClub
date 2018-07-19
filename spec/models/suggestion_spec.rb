require 'rails_helper'

describe Suggestion, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:author)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:rating)}
    it {should validate_presence_of(:comment)}
  end
  describe 'relationships' do
    it {should belong_to(:user)}
  end
end
