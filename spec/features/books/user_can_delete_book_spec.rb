require 'rails_helper'

describe 'user can delete book' do
  it 'can delete book' do
    author1 = Author.create(name: 'Orson Card')
    book1 = author1.books.create(title: 'Title', year: 1900)

    visit author_book_path(author1, book1)

    click_on 'Delete Book'

    expect(current_path).to eq(books_path)
    expect(page).to_not have_content(book1.title)
  end
end
