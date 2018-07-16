require 'rails_helper'

describe 'user can create author' do
  it 'can create author' do

    author = 'Orson Scott Card'
    visit new_author_path

    fill_in :author_name, with: 'author'
    click_on "Create Author"

    expect(current_path).to eq(author_path(Author.last))
    expect(page).to have_content(author)
  end
end
