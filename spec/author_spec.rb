require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Book do
  before(:each) do
    @book = Book.new({author_first_name: "Harper", 
                      author_last_name: "Lee", 
                      title: "To Kill a Mockingbird", 
                      publication_date: "July 11, 1960"})
    @charlotte_bronte = Author.new({first_name: "Charlotte", 
                                    last_name: "Bronte"})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@charlotte_bronte).to be_a(Author)
    end

    it 'has a name' do
      expect(@charlotte_bronte.name).to eq('Charlotte Bronte')
    end

    it 'has books' do
      expect(@charlotte_bronte.books).to eq([])
    end
  end
end