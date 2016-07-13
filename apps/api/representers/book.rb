require 'roar/decorator'
require 'roar/json'

module Api::Representers
  class Book < Roar::Decorator
    include Roar::JSON

    property :id
    property :title
    property :author
  end
end
