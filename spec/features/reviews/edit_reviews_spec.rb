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
      fill_in :review_rating, with: rating
      fill_in :review_comment, with: comment
      click_on 'Edit Review'

      expect(current_path).to eq(author_book_path(author, book))
      expect(page).to have_content(rating)
      expect(page).to have_content(comment)
    end
  end
end
