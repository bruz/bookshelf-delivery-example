module Api::Controllers::Books
  class Destroy
    include Api::Action

    params do
      required(:id).filled(:int?)
    end

    def call(params)
      result = Book::Destroy.new(params[:id]).call

      if result.success?
        self.status = 204
      else
        halt 404, JSON.generate(error_type: :not_found)
      end
    end
  end
end
