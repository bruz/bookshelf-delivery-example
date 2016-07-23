module Api::Controllers::Books
  class Create
    include Api::Action

    params do
      required(:title).filled(:str?)
      required(:author).filled(:str?)
    end

    def call(params)
      result = Book::Create.new(params[:title], params[:author]).call
      book = result.book

      self.status = 201
      self.body = Api::Representers::Book.new(book).to_json
    end
  end
end
