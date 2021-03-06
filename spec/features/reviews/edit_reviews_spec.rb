require 'rails_helper'

describe 'edit reviews' do
  context 'as admin' do
    it 'can edit reviews from book show page' do
      admin = User.create(username: 'bob', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      author = Author.create(name: 'Card, Orson Scott')
      book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
      review1 = admin.reviews.create(rating: 5, comment: 'Excellent!', book_id: book.id)

      rating = 4
      comment = 'Pretty good'

      visit author_book_path(author, book)
      click_on 'Edit Review'

      expect(current_path).to eq(edit_book_review_path(book, review1))
      select rating, from: :review_rating
      fill_in :review_comment, with: comment
      click_on 'Update Review'

      expect(current_path).to eq(author_book_path(author, book))
      expect(page).to have_content(rating)
      expect(page).to have_content(comment)
    end
  end
  context 'as user' do
    it 'cannot see edit link on book show page' do
      user = User.create(username: 'Angela', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      author = Author.create(name: 'Card, Orson Scott')
      book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
      review1 = user.reviews.create(rating: 5, comment: 'Excellent!', book_id: book.id)

      visit author_book_path(author, book)
      expect(page).to_not have_content('Edit Review')
    end
    it 'can edit reviews from user show page' do
      user = User.create(username: 'Angela', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      author = Author.create(name: 'Card, Orson Scott')
      book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
      review1 = user.reviews.create(rating: 5, comment: 'Excellent!', book_id: book.id)

      rating = 4
      comment = 'Pretty good'

      visit user_path(user)
      click_on 'Edit Review'

      expect(current_path).to eq(edit_book_review_path(book, review1))
      select rating, from: :review_rating
      fill_in :review_comment, with: comment
      click_on 'Update Review'

      expect(current_path).to eq(author_book_path(author, book))
      expect(page).to have_content(rating)
      expect(page).to have_content(comment)
    end
  end
end
