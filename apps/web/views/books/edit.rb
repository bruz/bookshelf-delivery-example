module Web::Views::Books
  class Edit
    include Web::View

    def form
      Form.new(:book, routes.book_path(book.id), { book: book },
               method: :patch)
    end

    def submit_label
      'Update'
    end
  end
end
