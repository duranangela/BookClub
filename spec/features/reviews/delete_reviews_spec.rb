require 'rails_helper'

describe 'delete reviews' do
  context 'as adming' do
    it 'can delete reviews from book show page' do
      admin = User.create(username: 'bob', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      author = Author.create(name: 'Card, Orson Scott')
      book = author.books.create(title: "Ender's Game", year: 1986, image: "Ender's_game.jpg")
      review1 = admin.reviews.create(rating: 5, comment: 'Excellent!', book_id: book.id)

      visit author_book_path(author, book)
      click_on 'Delete Review'

      expect(page).to_not have_content(review1.rating)
      expect(page).to_not have_content(review1.comment)
    end
  end
  context 'as user' do
    it 'cannot see delete link on book show page' do
      user = User.create(username: 'Angela', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      author = Author.create(name: 'Card, Orson Scott')
      book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
      review1 = user.reviews.create(rating: 5, comment: 'Excellent!', book_id: book.id)

      visit author_book_path(author, book)
      expect(page).to_not have_content('Delete Review')
    end
    it 'can delete review from user show page' do
      user = User.create(username: 'Angela', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      author = Author.create(name: 'Card, Orson Scott')
      book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
      review1 = user.reviews.create(rating: 4, comment: 'Excellent!', book_id: book.id)

      visit user_path(user)
      click_on 'Delete Review'

      expect(current_path).to eq(author_book_path(author, book))
      expect(page).to_not have_content(review1.rating)
      expect(page).to_not have_content(review1.comment)
    end
  end
end
