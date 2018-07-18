require 'rails_helper'

describe 'visitor visits book index page' do
  it 'sees a list of all books, with links to show pages' do
    author1 = Author.create(name: 'Orson Scott Card')
    author2 = Author.create(name: 'Sherri S. Tepper')
    book1 = author1.books.create(title: "Ender's Game", year: 1985, image: "Ender's_game.jpg")
    book2 = author1.books.create(title: "Treason", year: 1988, image: "Treason.jpg")
    book3 = author2.books.create(title: "The Gate to Women's Country", year: 1988, image: "The_Gate_to_Women's_Country.jpg")
    book4 = author2.books.create(title: "The Awakeners", year: 1987, image: "The_Awakeners.jpg")

    visit books_path

    expect(page).to have_content(book1.title)
    expect(page).to have_content(book2.title)
    expect(page).to have_content(book3.title)
    expect(page).to have_content(book4.title)
  end
end
