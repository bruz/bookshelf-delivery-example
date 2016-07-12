require 'hanami/interactor'

class Book::Destroy
  include Hanami::Interactor

  expose :activity

  def initialize(id)
    @book = BookRepository.find(id)
    @activity = Activity.new(
      timestamp: Time.now,
      action: Activity::Action::DELETE,
      old_title: @book.title,
      old_author: @book.author
    )
  end

  def call
    BookRepository.transaction do
      BookRepository.delete(@book)
      @activity = ActivityRepository.create(@activity)
    end
  end
end
