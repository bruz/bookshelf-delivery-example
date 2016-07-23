module Web::Controllers::Books
  class Destroy
    include Web::Action

    params do
      required(:id).filled(:int?)
    end

    def call(params)
      Book::Destroy.new(params[:id]).call
      redirect_to routes.books_path
    end
  end
end
