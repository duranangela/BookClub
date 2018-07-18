require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password)}
  end
  describe 'relationships' do
    it {should have_many(:reviews)}
    it {should have_many(:books).through(:reviews)}
    it {should have_many(:suggestions)}
  end
  describe "roles" do
    it "can be created as an admin" do
      user = User.create(username: "penelope",
                         password: "boom",
                         role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "can be created as a default user" do
      user = User.create(username: "sammy",
                         password: "pass",
                         role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end
  describe 'instance methods' do
    it 'orders reviews by latest first' do
      user = User.create(username: 'Angela', password: '12345')
      author = Author.create(name: 'Card, Orson Scott')
      book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
      review1 = user.reviews.create(rating: 5, comment: 'Excellent!', book_id: book.id)
      review2 = user.reviews.create(rating: 3, comment: 'Pretty Good!', book_id: book.id)

      expected = [review2, review1]

      expect(user.order_reviews).to eq(expected)
    end
  end
end
