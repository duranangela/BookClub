require 'rails_helper'

describe 'user can create book' do
  it 'can create book' do
    author = Author.create(name: 'Orson Scott Card')
    book_title = 'Treason'
    book_year = 1988

    visit new_author_book_path(author)

    fill_in :book_title, with: book_title
    fill_in :book_year, with: book_year
    click_on "Create Book"

    expect(current_path).to eq(author_book_path(author, Book.last))
    expect(page).to have_content(book_title)
    expect(page).to have_content(book_year)
  end
end
