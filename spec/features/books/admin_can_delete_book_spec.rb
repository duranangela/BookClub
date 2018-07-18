require 'rails_helper'

describe 'only admin can delete book' do
  context 'as admin' do
    it 'can delete book' do
      admin = User.create(username: 'bob', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      author1 = Author.create(name: 'Orson Card')
      book1 = author1.books.create(title: 'Title', year: 1900)

      visit author_book_path(author1, book1)

      click_on 'Delete Book'

      expect(current_path).to eq(books_path)
      expect(page).to_not have_content(book1.title)
    end
  end
  context 'as default user or visitor' do
    it 'cannot see link' do
      user = User.create(username: 'fred', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      author1 = Author.create(name: 'Orson Card')
      book1 = author1.books.create(title: 'Title', year: 1900)

      visit author_book_path(author1, book1)

      expect(page).to_not have_content("Delete Book")
    end
  end
end
