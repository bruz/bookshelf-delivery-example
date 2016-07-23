require 'features_helper'

describe 'Books' do
  before do
    BookRepository.clear
    @book = Book::Create.new('A title', 'An author').call.book
  end

  it 'can update a book' do
    visit "/books/#{@book.id}/edit"

    within 'form#book-form' do
      fill_in 'Title',  with: 'Updated title'
      fill_in 'Author', with: 'Updated author'

      click_button 'Update'
    end

    current_path.must_equal('/books')
    assert page.has_content?('Updated title')
  end

  it 'displays list of errors when params contains errors' do
    visit "/books/#{@book.id}/edit"

    within 'form#book-form' do
      fill_in 'Title',  with: ''
      fill_in 'Author', with: ''

      click_button 'Update'
    end

    current_path.must_equal("/books/#{@book.id}")

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('Title must be filled')
    assert page.has_content?('Author must be filled')
  end
end
