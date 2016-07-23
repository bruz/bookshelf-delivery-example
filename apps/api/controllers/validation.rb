module Api
  module Controllers
    module Validation
      def self.included(action)
        action.class_eval do
          before :validate!
        end
      end

      private

      def validate!
        error(422) unless params.valid?
      end

      def error(code)
        errors = params.errors.each_with_object({}) do |error, result|
          result[error.first] = :missing
        end

        message = JSON.generate(
          error_type: :invalid_params,
          params: errors
        )

        halt code, message
      end
    end
  end
end
