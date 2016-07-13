require 'hanami/interactor'

class Book::Destroy
  include Hanami::Interactor

  expose :activity

  def initialize(id)
    @book = BookRepository.find(id)
  end

  def call
    if @book
      @activity = build_activity

      BookRepository.transaction do
        BookRepository.delete(@book)
        @activity = ActivityRepository.create(@activity)
      end
    else
      fail!
    end
  end

  private

  def build_activity
    Activity.new(
      timestamp: Time.now,
      action: Activity::Action::DELETE,
      old_title: @book.title,
      old_author: @book.author
    )
  end
end
