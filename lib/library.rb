class Library
attr_reader :name, 
            :books, 
            :authors, 
            :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    author&.books.map do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    @time_frame_hash = Hash.new
    start_year = author.books.min_by do |book|
      book.publication_year
    end
    end_year = author.books.max_by do |book|
      book.publication_year
    end
      @time_frame_hash[:start] = start_year.publication_year
      @time_frame_hash[:end] = end_year.publication_year
      @time_frame_hash
  end

  def check_out(book)
    if @books.include?(book)
      @checked_out_books << book
    end
  end

  def return_book(book)
    if @checked_out_books.include?(book)
      @checked_out_books.delete(book)
    end
  end
end
