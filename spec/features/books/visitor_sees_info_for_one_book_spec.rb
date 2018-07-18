require 'rails_helper'

describe 'visitor visits book show page' do
  it 'sees book avg_rating, title, year, image, and author' do
    user = User.create(username: 'Angela', password: '12345')
    author = Author.create(name: 'Card, Orson Scott')
    book = author.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
    review1 = user.reviews.create(rating: 5, comment: 'Excellent!', book_id: book.id)
    review2 = user.reviews.create(rating: 3, comment: 'Pretty Good!', book_id: book.id)

    visit author_book_path(author, book)

    expect(page).to have_content(book.avg_rating)
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.year)

    click_on author.name

    expect(current_path).to eq(author_path(author))
  end

end
