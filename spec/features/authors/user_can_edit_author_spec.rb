require 'rails_helper'

describe 'user can edit an author' do
  it 'can edit author info' do
    author1 = Author.create(name: 'Orson Card')
    author_edit = 'Orson Scott Card'

    visit edit_author_path(author1)

    fill_in :author_name, with: author_edit
    click_on 'Update Author'

    expect(current_path).to eq(author_path(author1))
    expect(page).to have_content(author_edit)
  end
end
