require 'rails_helper'

describe 'user can edit book' do
  it 'can edit book' do
    author = Author.create(name: 'Orson Scott Card')
    book1 = author.books.create(title: "Enders Game", year: 1985, image: "Ender's_game.jpg")
    book_edit = "Ender's Game"

    visit author_book_path(author, book1)
    click_on "Edit Book"

    fill_in :book_title, with: book_edit
    click_on "Update Book"

    expect(current_path).to eq(author_book_path(author, book1))
    expect(page).to have_content(book_edit)
  end
end
