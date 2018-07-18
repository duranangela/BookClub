require 'rails_helper'

describe Book, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:year)}
    it {should validate_presence_of(:image)}
  end
  describe 'relationships' do
    it {should belong_to(:author)}
    it {should have_many(:reviews)}
    it {should have_many(:users).through(:reviews)}
  end
  describe 'class methods' do
    it 'puts books in alphabetical order by title' do
      author = Author.create(name: 'Orson Scott Card')
      book1 = author.books.create(title: "Treason", year: 1988, image: "Treason.jpg")
      book2 = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")

      expected = [book2, book1]

      expect(Book.alpha_order).to eq(expected)
    end
  end
  describe 'instance methods' do
    it 'gives average rating for book' do
      user = User.create(username: 'Angela', password: '12345')
      author = Author.create(name: 'Card, Orson Scott')
      book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
      review1 = user.reviews.create(rating: 5, comment: 'Excellent!', book_id: book.id)
      review2 = user.reviews.create(rating: 3, comment: 'Pretty Good!', book_id: book.id)

      expected = 4

      expect(book.avg_rating).to eq(expected)
    end
  end
end
