class Library
attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author&.books.map do |book|
      @books << book
    end
    @authors
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
end
