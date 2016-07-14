require 'features_helper'

describe 'PUT /api/books/:id' do
  before do
    BookRepository.clear
  end

  let(:book) { Book::Create.new('Clean Code', 'Robert Martin').call.book }
  let(:new_title) { 'Exceptional Ruby' }
  let(:new_author) { 'Avdi Grimm' }

  it 'updates an existing book' do
    stdout, _stderr = cli_command('update', book.id, new_title, new_author)
    stdout.must_match new_title
    stdout.must_match new_author

    book = BookRepository.first
    book.title.must_equal new_title
    book.author.must_equal new_author
  end

  it 'shows a not found error when the book does not exist' do
    _, stderr = cli_command('update', 0, new_title, new_author)
    stderr.must_match 'not found'
  end
end
