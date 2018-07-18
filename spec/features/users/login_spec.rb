require 'rails_helper'

describe 'login workflow' do
  it 'allows registered users to log in successfully' do
    user = User.create(username: 'Ian', password: 'test')

    visit '/'
    click_on 'Member Log In'
    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on 'Log In'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}!")
    expect(page).to have_content("Log Out")
    expect(page).to_not have_content("I already have an account")
  end
  it 'allows registered users to log out' do
    user = User.create(username: 'Kee-gan', password: 'test')

    visit '/'
    click_on 'Member Log In'
    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on 'Log In'
    click_on 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Member Log In")
  end
end
