require 'rails_helper'

describe 'only admin can delete author' do
  context 'as admin' do
    it 'can delete author' do
      author1 = Author.create(name: 'Orson Card')
      admin = User.create(username: 'bob', password: 'test', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit author_path(author1)

      click_on 'Delete Author'

      expect(current_path).to eq(authors_path)
      expect(page).to_not have_content(author1.name)
    end
  end
  context 'as default user' do
    it 'cannot see delete link' do
      author1 = Author.create(name: 'Orson Card')
      user = User.create(username: 'fred', password: '12345')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit author_path(author1)

      expect(page).to_not have_content('Delete Author')
    end
  end
end
