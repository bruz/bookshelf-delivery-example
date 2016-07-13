require 'hanami/interactor'

class Book::Update
  include Hanami::Interactor

  expose :activity, :book

  def initialize(id, title, author)
    @book = BookRepository.find(id)
    @title = title
    @author = author
  end

  def call
    if @book
      @book.update(title: @title, author: @author)
      @activity = build_activity

      BookRepository.transaction do
        @book = BookRepository.update(@book)
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
      action: Activity::Action::UPDATE,
      old_title: @book.title,
      old_author: @book.author,
      new_title: @title,
      new_author: @author
    )
  end
end
