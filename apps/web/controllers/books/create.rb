module Web::Controllers::Books
  class Create
    include Web::Action

    expose :book

    params do
      required(:book).schema do
        required(:title).filled(:str?)
        required(:author).filled(:str?)
      end
    end

    def call(params)
      return unless params.valid?

      title, author = params[:book].to_h.values_at(:title, :author)
      result = Book::Create.new(title, author).call
      @book = result.book

      redirect_to routes.books_path
    end
  end
end
