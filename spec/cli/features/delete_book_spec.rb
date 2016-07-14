require 'features_helper'

describe 'DELETE /api/books/:id' do
  before do
    BookRepository.clear
  end

  let(:book) { Book::Create.new('Clean Code', 'Robert Martin').call.book }

  it 'deletes an existing book' do
    stdout, _stderr = cli_command('delete', book.id)
    stdout.must_match 'deleted'

    BookRepository.all.to_a.size.must_equal 0
  end

  it 'shows a not found error when the book does not exist' do
    _, stderr = cli_command('delete', 0)
    stderr.must_match 'not found'
  end
end
