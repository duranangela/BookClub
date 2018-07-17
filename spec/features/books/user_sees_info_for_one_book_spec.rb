require 'rails_helper'

describe 'visitor sees info on book show page' do
  it 'sees book title, year, image, and author' do
    author1 = Author.create(name: 'Orson Scott Card')
    book1 = author1.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")

    visit author_book_path(author1, book1)

    expect(page).to have_content(book1.title)
    expect(page).to have_content(book1.year)

    click_on author1.name

    expect(current_path).to eq(author_path(author1))
  end
end
