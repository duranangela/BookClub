require 'rails_helper'

describe 'delete reviews' do
  context 'as adming' do
    it 'can delete reviews from book show page' do
      admin = User.create(username: 'bob', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      author = Author.create(name: 'Card, Orson Scott')
      book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
      review1 = admin.reviews.create(rating: 5, comment: 'Excellent!', book_id: book.id)

      visit author_book_path(author, book)
      click_on 'Delete Review'

      expect(page).to_not have_content(review1.rating)
      expect(page).to_not have_content(review1.comment)
    end
  end
end
