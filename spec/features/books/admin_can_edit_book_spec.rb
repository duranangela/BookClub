require 'rails_helper'

describe 'only admin can edit book' do
  context 'as admin' do
    it 'can edit book' do
      admin = User.create(username: 'bob', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

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
  context 'as default user or visitor' do
    it 'cannot see page' do
      user = User.create(username: 'fred', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      author = Author.create(name: 'Orson Scott Card')
      book1 = author.books.create(title: "Enders Game", year: 1985, image: "Ender's_game.jpg")

      visit author_book_path(author, book1)

      expect(page).to_not have_content("Edit Book")

      visit edit_author_book_path(author, book1)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
