require 'features_helper'

describe 'List books' do
  before do
    BookRepository.clear

    BookRepository.create(Book.new(title: 'PoEAA', author: 'Martin Fowler'))
    BookRepository.create(Book.new(title: 'TDD', author: 'Kent Beck'))
  end

  it 'shows a book element for each book' do
    visit '/books'
    assert page.has_css?('.book', count: 2), 'Expected to find 2 books'
  end
end
