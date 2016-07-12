module Web::Controllers::Books
  class Create
    include Web::Action

    expose :book

    params do
      param :book do
        param :title,  presence: true
        param :author, presence: true
      end
    end

    def call(params)
      if params.valid?
        title, author = params[:book].to_h.values_at('title', 'author')
        result = Book::Create.new(title, author).call
        @book = result.book

        redirect_to routes.books_path
      end
    end
  end
end
