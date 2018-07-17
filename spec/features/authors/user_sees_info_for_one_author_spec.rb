require 'rails_helper'

describe 'user sees info on author show page' do
  it 'sees author name and books by that author' do
    author1 = Author.create(name: 'Orson Scott Card')
    book1 = author1.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
    book2 = author1.books.create(title: "Treason", year: 1988, image: "Treason.jpg")

    visit author_path(author1)

    expect(page).to have_content(author1.name)
    expect(page).to have_content(book1.title)
    expect(page).to have_content(book2.title)

  end
end
