require 'rails_helper'

describe 'only admin can see all suggesions' do
  context 'as admin' do
    it 'can see all suggestions' do
      user = User.create(username: 'Angela', password: '12345')
      admin = User.create(username: 'bob', password: 'test', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      suggestion = user.suggestions.create(author: 'Hesse', title: 'Siddhartha', rating: 4, comment: 'I liked it')

      visit user_path(admin)

      click_on 'See all suggestions'

      expect(current_path).to eq(suggestions_path)
      expect(page).to have_content(suggestion.author)
      expect(page).to have_content(suggestion.title)
      expect(page).to have_content(suggestion.rating)
      expect(page).to have_content(suggestion.comment)
    end
  end
end
