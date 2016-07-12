# spec/web/views/books/index_spec.rb
require 'spec_helper'
require_relative '../../../../apps/web/views/books/index'

class IndexBooksParams < Hanami::Action::Params
end

def create_book(title, author)
  Book::Create.new(title, author).call.book
end

describe Web::Views::Books::Index do
  let(:book) { Book::Create.new('A title', 'An author').call.book }
  let(:params)    { IndexBooksParams.new({}) }
  let(:exposures) { Hash[params: params, books: []] }
  let(:template)  do
    Hanami::View::Template.new('apps/web/templates/books/index.html.erb')
  end
  let(:view)      { Web::Views::Books::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  before do
    BookRepository.clear
  end

  it 'exposes #books' do
    view.books.must_equal exposures.fetch(:books)
  end

  describe 'when there are no books' do
    it 'shows a placeholder message' do
      rendered.must_include(
        '<p class="placeholder">There are no books yet.</p>'
      )
    end
  end

  describe 'when there are books' do
    let(:book1)     { create_book 'Refactoring', 'Martin Fowler' }
    let(:book2)     { create_book 'Domain Driven Design', 'Eric Evans' }
    let(:exposures) { Hash[params: params, books: [book1, book2]] }

    it 'lists them all' do
      rendered.scan(/class="book"/).count.must_equal 2
      rendered.must_include('Refactoring')
      rendered.must_include('Domain Driven Design')
    end

    it 'hides the placeholder message' do
      rendered.wont_include(
        '<p class="placeholder">There are no books yet.</p>'
      )
    end
  end
end
