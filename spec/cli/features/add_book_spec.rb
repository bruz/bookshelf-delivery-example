require 'cli_features_helper'

describe 'POST /api/books' do
  before do
    BookRepository.clear
  end

  let(:book_title) { 'Confident Ruby' }
  let(:book_author) { 'Avdi Grimm' }

  it 'adds a new book' do
    stdout, _stderr = cli_command('add', book_title, book_author)
    stdout.must_match book_title
    stdout.must_match book_author

    book = BookRepository.first
    book.title.must_equal book_title
    book.author.must_equal book_author
  end

  it 'displays an error there is a missing parameter' do
    _, stderr = cli_command('add', book_title)
    stderr.must_match 'ERROR'
  end
end
