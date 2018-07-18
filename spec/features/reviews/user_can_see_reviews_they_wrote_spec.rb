require 'rails_helper'

describe 'user can see reviews they wrote' do
  it 'can see reviews on user show page' do
    user = User.create(username: 'Angela', password: '12345')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    author = Author.create(name: 'Card, Orson Scott')
    book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
    review1 = user.reviews.create(rating: 5, comment: 'Excellent!', book_id: book.id)
    review2 = user.reviews.create(rating: 4, comment: 'Pretty Good!', book_id: book.id)

    visit user_path(user)

    expect(page).to have_content(review1.book.title)
    expect(page).to have_content(review1.rating)
    expect(page).to have_content(review1.comment)
    expect(page).to have_content(review1.time)
    expect(page).to have_content(review2.book.title)
    expect(page).to have_content(review2.rating)
    expect(page).to have_content(review2.comment)
    expect(page).to have_content(review2.time)
  end
end
