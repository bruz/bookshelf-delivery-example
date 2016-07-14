class CLI < Thor
  desc 'list', 'List all books'
  def list
    books = BookRepository.all
    books.each { |book| puts render_book(book) }
  end

  desc 'add TITLE AUTHOR', 'Add a book'
  def add(title, author)
    book = Book::Create.new(title, author).call.book
    $stdout.puts "Book added => #{render_book(book)}"
  end

  desc 'update ID TITLE AUTHOR', 'Update a book'
  def update(id, title, author)
    result = Book::Update.new(id, title, author).call

    if result.success?
      $stdout.puts "Book updated => #{render_book(result.book)}"
    else
      $stderr.puts "Book id #{id} not found"
    end
  end

  desc 'delete ID TITLE AUTHOR', 'Delete a book'
  def delete(id)
    result = Book::Destroy.new(id).call

    if result.success?
      $stdout.puts "Book deleted => #{render_book(result.book)}"
    else
      $stderr.puts "Book id #{id} not found"
    end
  end

  private

  def render_book(book)
    "#{book.title} (#{book.author}), id: #{book.id}"
  end
end
