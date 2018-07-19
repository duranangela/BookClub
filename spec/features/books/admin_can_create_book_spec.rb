require 'rails_helper'

describe 'only admin can create book' do
  context 'as admin' do
    it 'can create book' do
      admin = User.create(username: 'bob', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      author = Author.create(name: 'Orson Scott Card')
      book_title = 'Treason'
      book_year = 1988

      visit author_path(author)
      click_on "Create a New Book by #{author.name_switch}"

      expect(current_path).to eq(new_author_book_path(author))

      fill_in :book_title, with: book_title
      fill_in :book_year, with: book_year
      click_on "Create Book"

      expect(current_path).to eq(author_book_path(author, Book.last))
      expect(page).to have_content(book_title)
      expect(page).to have_content(book_year)
    end
  end
  context 'as default user or visitor' do
    it 'cannot see page' do
      user = User.create(username: 'fred', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      author1 = Author.create(name: 'Orson Card')

      visit author_path(author1)

      expect(page).to_not have_content("Create a New Book by #{author1.name}")

      visit new_author_book_path(author1)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
