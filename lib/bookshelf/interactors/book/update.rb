require 'hanami/interactor'

class Book::Update
  include Hanami::Interactor

  expose :activity, :book

  def initialize(id, title, author)
    @book = BookRepository.find(id)
    @activity = Activity.new(
      timestamp: Time.now,
      action: Activity::Action::UPDATE,
      old_title: @book.title,
      old_author: @book.author,
      new_title: title,
      new_author: author
    )
    @book.update(title: title, author: author)
  end

  def call
    BookRepository.transaction do
      @book = BookRepository.update(@book)
      @activity = ActivityRepository.create(@activity)
    end
  end
end
