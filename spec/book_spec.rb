require_relative 'spec_helper'

RSpec.describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
  end
  it 'Takes two parameters and returns a Book object' do
    @book.should be_an_instance_of Book
  end

  it 'Check for the title of the book' do
    @book.title.should eql 'Title'
  end

  it 'Check for the author of the book' do
    @book.author.should eql 'Author'
  end
end
