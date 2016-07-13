require 'features_helper'

describe 'DELETE /api/books/:id' do
  before do
    BookRepository.clear
  end

  let(:book) { Book::Create.new('Clean Code', 'Robert Martin').call.book }

  it 'deletes an existing book' do
    delete "/api/books/#{book.id}"

    last_response.status.must_equal 204
    BookRepository.all.to_a.size.must_equal 0
  end

  it 'shows a not found error when the book does not exist' do
    delete '/api/books/0'

    last_response.status.must_equal 404
    parsed = JSON.parse(last_response.body, symbolize_names: true)
    parsed[:error_type].must_equal 'not_found'
  end
end
