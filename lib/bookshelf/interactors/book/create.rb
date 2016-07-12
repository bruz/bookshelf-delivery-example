require 'hanami/interactor'

class Book::Create
  include Hanami::Interactor

  expose :activity, :book

  def initialize(title, author)
    @book = Book.new(title: title, author: author)
    @activity = Activity.new(
      timestamp: Time.now,
      action: Activity::Action::CREATE,
      new_title: title,
      new_author: author
    )
  end

  def call
    BookRepository.transaction do
      @book = BookRepository.create(@book)
      @activity = ActivityRepository.create(@activity)
    end
  end
end
