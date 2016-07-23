module Api::Controllers::Books
  class Update
    include Api::Action

    params do
      required(:id).filled(:int?)
      required(:title).filled(:str?)
      required(:author).filled(:str?)
    end

    def call(params)
      update = Book::Update.new(params[:id], params[:title], params[:author])
      result = update.call

      if result.success?
        render_success(result.book)
      else
        render_failure
      end
    end

    private

    def render_success(book)
      self.status = 200
      self.body = Api::Representers::Book.new(book).to_json
    end

    def render_failure
      halt 404, JSON.generate(error_type: :not_found)
    end
  end
end
