require 'rails_helper'

describe 'registration workflow' do
  # before(:each) do
  #   User.create(username: 'bob', password: 'password')
  # end

  it 'submits registration form successfully' do
    username = 'funtime'

    visit '/'

    click_on 'Sign up to be a Member'

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: '12345'

    click_on 'Create Member'

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome, #{username}")
  end
end
