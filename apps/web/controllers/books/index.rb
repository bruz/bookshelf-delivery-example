module Web::Controllers::Books
  class Index
    include Web::Action

    expose :books

    def call(_)
      @books = BookRepository.all
    end
  end
end
