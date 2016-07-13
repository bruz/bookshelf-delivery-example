require 'features_helper'

describe 'POST /api/books' do
  before do
    BookRepository.clear
  end

  let(:book_title) { 'Confident Ruby' }
  let(:book_author) { 'Avdi Grimm' }

  it 'adds a new book' do
    post '/api/books', title: book_title, author: book_author

    last_response.status.must_equal 201
    parsed = JSON.parse(last_response.body)
    parsed['title'].must_equal book_title
    parsed['author'].must_equal book_author

    book = BookRepository.first
    book.title.must_equal book_title
    book.author.must_equal book_author
  end

  it 'displays list of errors when params contains errors' do
    post '/api/books', title: book_title

    last_response.status.must_equal 422
    parsed = JSON.parse(last_response.body, symbolize_names: true)
    parsed[:error_type].must_equal 'invalid_params'
    parsed[:params].must_equal author: 'missing'
  end
end
