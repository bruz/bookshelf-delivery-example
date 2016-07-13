require 'roar/decorator'
require 'roar/json'

module Api::Representers
  class Books < Roar::Decorator
    include Roar::JSON

    collection :books
  end
end
