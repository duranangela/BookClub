require 'rails_helper'

describe 'user sees info on author show page' do
  it 'sees author name and books by that author' do
    author1 = Author.create(name: 'Orson Scott Card')

    visit author_path(author1)

    expect(page).to have_content(author1.name)
  end
end
