class Book
  attr_reader :title, :author, :publication_year

  def initialize(book_details)
    @author_first_name = book_details[:author_first_name]
    @author_last_name = book_details[:author_last_name]
    @title = book_details[:title]
    @publication_date = book_details[:publication_date]
    @author = "#{@author_first_name} #{@author_last_name}"
  end
  
  def publication_year
    @publication_year = @publication_date.split.last
  end
end
