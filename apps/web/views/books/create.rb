module Web::Views::Books
  class Create
    include Web::View

    template 'books/new'

    def form
      Form.new(:book, routes.books_path)
    end

    def submit_label
      'Create'
    end
  end
end
