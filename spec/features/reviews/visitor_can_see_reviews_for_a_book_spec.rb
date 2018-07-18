require 'rails_helper'

describe 'visitor visits book show page' do
  it 'sees all reviews for that book' do
    user2 = User.create(username: 'Angela', password: '12345')
    user3 = User.create(username: 'Carlos', password: '12345')
    author = Author.create(name: 'Card, Orson Scott')
    book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
    review1 = user2.reviews.create(rating: 5, comment: 'Excellent!', book_id: book.id)
    review2 = user3.reviews.create(rating: 4, comment: 'Pretty Good!', book_id: book.id)

    visit author_book_path(author, book)

    expect(page).to have_content(review1.rating)
    expect(page).to have_content(review1.comment)
    expect(page).to have_content(review1.user.username)
    expect(page).to have_content(review2.rating)
    expect(page).to have_content(review2.comment)
    expect(page).to have_content(review2.user.username)
  end
end
