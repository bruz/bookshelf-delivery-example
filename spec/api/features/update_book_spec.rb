require 'features_helper'

describe 'PUT /api/books/:id' do
  before do
    BookRepository.clear
  end

  let(:book) { Book::Create.new('Clean Code', 'Robert Martin').call.book }
  let(:new_title) { 'Exceptional Ruby' }
  let(:new_author) { 'Avdi Grimm' }

  it 'updates an existing book' do
    patch "/api/books/#{book.id}", title: new_title, author: new_author

    last_response.status.must_equal 200
    parsed = JSON.parse(last_response.body)
    parsed['title'].must_equal new_title
    parsed['author'].must_equal new_author

    book = BookRepository.first
    book.title.must_equal new_title
    book.author.must_equal new_author
  end

  it 'shows a not found error when the book does not exist' do
    patch '/api/books/0', title: new_title, author: new_author

    last_response.status.must_equal 404
    parsed = JSON.parse(last_response.body, symbolize_names: true)
    parsed[:error_type].must_equal 'not_found'
  end
end
