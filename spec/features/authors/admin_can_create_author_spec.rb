require 'rails_helper'

describe 'only admin can create author' do
  context 'as admin' do
    it 'can create author' do
      author = 'Orson Scott Card'
      admin = User.create(username: 'bob', password: 'test', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_author_path

      expect(page).to have_content("Create a New Author")

      fill_in :author_name, with: author
      click_on "Create Author"

      expect(current_path).to eq(author_path(Author.last))
      expect(page).to have_content(author)
    end
  end
  context 'as default user' do
    it 'cannot see page' do
      user = User.create(username: 'fred', password: '12345')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_author_path

      expect(page).to_not have_content("Create a New Author")
    end
  end
end
