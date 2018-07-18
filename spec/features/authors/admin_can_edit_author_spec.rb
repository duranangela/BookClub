require 'rails_helper'

describe 'only admin can edit an author' do
  context 'as admin' do
    it 'can edit author info' do
      author1 = Author.create(name: 'Orson Card')
      author_edit = 'Orson Scott Card'
      admin = User.create(username: 'bob', password: 'test', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit author_path(author1)

      expect(page).to have_content('Edit Author')
      click_on 'Edit Author'

      expect(current_path).to eq(edit_author_path(author1))
      fill_in :author_name, with: author_edit
      click_on 'Update Author'

      expect(current_path).to eq(author_path(author1))
      expect(page).to have_content(author_edit)
    end
  end
  context 'as default user or visitor' do
    it 'cannot see page' do
      author1 = Author.create(name: 'Orson Card')
      user = User.create(username: 'fred', password: '12345')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit author_path(author1)

      expect(page).to_not have_content("Edit Author")

      visit edit_author_path(author1)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
