require 'rails_helper'

describe 'only user can create suggestion' do
  context 'as user' do
    it 'can create a suggestion' do
      user = User.create(username: 'Angela', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      author = 'Herman Hesse'
      title = 'Siddhartha'
      rating = 4
      comment = 'I liked it'

      visit user_path(user)
      click_on 'Make a Book Suggestion'

      expect(current_path).to eq(new_user_suggestion_path(user))
      fill_in :suggestion_author, with: author
      fill_in :suggestion_title, with: title
      select rating, from: :suggestion_rating
      fill_in :suggestion_comment, with: comment
      click_on 'Create Suggestion'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(author)
      expect(page).to have_content(title)
      expect(page).to have_content(rating)
      expect(page).to have_content(comment)
    end
  end
end
