module Web::Views::Books
  class Update
    include Web::View

    template 'books/edit'

    def form
      Form.new(:book, routes.book_path(book.id), { book: book },
               method: :patch)
    end

    def submit_label
      'Update'
    end
  end
end
