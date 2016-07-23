module Web::Controllers::Books
  class Update
    include Web::Action

    expose :book

    params do
      required(:id).filled(:int?)
      required(:book).schema do
        required(:title).filled(:str?)
        required(:author).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        title, author = params[:book].to_h.values_at(:title, :author)
        result = Book::Update.new(params[:id], title, author).call
        @book = result.book

        redirect_to routes.books_path
      else
        @book = BookRepository.find(params[:id])
      end
    end
  end
end
