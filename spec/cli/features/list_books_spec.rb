require 'features_helper'

describe 'GET /api/books' do
  before do
    BookRepository.clear
    book
  end

  let(:book) { Book::Create.new('Clean Code', 'Robert Martin').call.book }

  it 'lists all books' do
    stdout, _stderr = cli_command('list')

    stdout.must_match book.title
    stdout.must_match book.author
  end
end
