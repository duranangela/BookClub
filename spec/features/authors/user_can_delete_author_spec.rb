require 'rails_helper'

describe 'user can delete author' do
  it 'can delete author' do
    author1 = Author.create(name: 'Orson Card')

    visit author_path(author1)

    click_on 'Delete Author'

    expect(current_path).to eq(authors_path)
    expect(page).to_not have_content(author1.name)
  end
end
