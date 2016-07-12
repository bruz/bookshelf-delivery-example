module Web::Controllers::Books
  class Destroy
    include Web::Action

    def call(params)
      Book::Destroy.new(params[:id]).call
      redirect_to routes.books_path
    end
  end
end
