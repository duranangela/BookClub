require 'rails_helper'

describe 'only admin can delete suggestions' do
  context 'as admin' do
    it 'can delete suggestions' do
      user = User.create(username: 'Angela', password: '12345')
      admin = User.create(username: 'bob', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      suggestion = user.suggestions.create(author: 'Hesse', title: 'Siddhartha', rating: 4, comment: 'I liked it')

      visit suggestions_path

      click_on 'Delete Suggestion'

      expect(page).to_not have_content(suggestion.author)
      expect(page).to_not have_content(suggestion.title)
      expect(page).to_not have_content(suggestion.rating)
      expect(page).to_not have_content(suggestion.comment)
    end
  end
end
