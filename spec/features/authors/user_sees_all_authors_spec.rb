require 'rails_helper'

describe 'user visits author index page' do
  it 'sees list of all authors, with links to show page' do
    author1 = Author.create(name: 'Orson Scott Card')
    author2 = Author.create(name: 'Sherri S. Tepper')
    author3 = Author.create(name: 'Stephen King')

    visit authors_path

    expect(page).to have_content(author1.name)
    expect(page).to have_content(author2.name)
    expect(page).to have_content(author3.name)

    click_on author1.name

    expect(current_path).to eq(author_path(author1))
  end
end
