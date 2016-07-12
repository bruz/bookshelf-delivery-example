module Web::Views::Books
  class Index
    include Web::View

    def title_and_author(book)
      "#{book.title} (#{book.author})"
    end

    def delete_form(book)
      Form.new(:book, routes.book_path(book.id),
               {}, method: :delete)
    end
  end
end
