require 'spec_helper'
require_relative '../../../../apps/web/controllers/books/destroy'

describe Web::Controllers::Books::Destroy do
  let(:book) { Book::Create.new('A title', 'An author').call.book }
  let(:action) { Web::Controllers::Books::Destroy.new }
  let(:params) { Hash[id: book.id] }

  before do
    BookRepository.clear
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 302
  end
end
