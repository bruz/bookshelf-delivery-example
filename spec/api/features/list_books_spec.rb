require 'features_helper'

describe 'GET /api/books' do
  before do
    BookRepository.clear
    book
  end

  let(:book) { Book::Create.new('Clean Code', 'Robert Martin').call.book }

  it 'lists all books' do
    get '/api/books'

    last_response.status.must_equal 200
    parsed = JSON.parse(last_response.body, symbolize_names: true)
    parsed[:books].first[:title].must_equal book.title
    parsed[:books].first[:author].must_equal book.author
  end
end
