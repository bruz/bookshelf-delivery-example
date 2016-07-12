require 'features_helper'

describe 'Books' do
  before do
    BookRepository.clear
    @book = Book::Create.new('A title', 'An author').call.book
  end

  it 'can delete a book' do
    visit '/books'

    within '.book' do
      click_button 'Delete'
    end

    current_path.must_equal('/books')
    assert page.has_no_content?('A title')
  end
end
