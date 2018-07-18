require 'rails_helper'

describe 'only user can create new review' do
  context 'as user' do
    it 'can create a review' do
      user = User.create(username: 'Angela', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      author = Author.create(name: 'Card, Orson Scott')
      book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
      rating = 4
      comment = 'Pretty good'

      visit author_book_path(author, book)
      click_on 'Write a Review'

      expect(current_path).to eq(new_book_review_path(book))
      fill_in :review_rating, with: rating
      fill_in :review_comment, with: comment
      click_on 'Create Review'

      expect(current_path).to eq(author_book_path(author, book))
      expect(page).to have_content(rating)
      expect(page).to have_content(comment)
    end
  end
  context 'as visitor' do
    it 'cannot see page' do
      author = Author.create(name: 'Card, Orson Scott')
      book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")

      visit author_book_path(author, book)
      expect(page).to_not have_content('Create Review')

      visit new_book_review_path(book)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
