require 'rails_helper'

describe Author, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end
  describe 'relationships' do
    it {should have_many(:books)}
  end
  describe 'class methods' do
    it 'puts authors in alphabetical order by name' do
      author1 = Author.create(name: 'King, Stephen')
      author2 = Author.create(name: 'Card, Orson Scott')


      expected = [author2, author1]

      expect(Author.alpha_order).to eq(expected)
    end
  end
end
