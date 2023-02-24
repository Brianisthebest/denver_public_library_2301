require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  before(:each) do
    @book = Book.new({author_first_name: "Harper", 
                      author_last_name: "Lee", 
                      title: "To Kill a Mockingbird", 
                      publication_date: "July 11, 1960"})
    @charlotte_bronte = Author.new({first_name: "Charlotte", 
                                    last_name: "Bronte"})
    @library = Library.new('Book Learning Library')
  end  

  describe '#initialize' do
    it 'exists' do
      expect(@library).to be_a(Library)
    end

    it 'has a name' do
      expect(@library.name).to eq('Book Learning Library')
    end

    it 'stores books' do
      expect(@library.books).to eq([])
    end

    it 'lists the authors' do
      expect(@library.authors).to eq([])
    end
  end

  describe '#add_author' do
    it 'adds the author' do
      @library.add_author(@charlotte_bronte)

      expect(@library.authors).to eq([@charlotte_bronte])
    end

    it 'can store books written by the author' do
      @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @villette = @charlotte_bronte.write("Villette", "1853")
      @library.add_author(@charlotte_bronte)

      expect(@library.books).to eq([@jane_eyre, @villette])
    end
  end
end