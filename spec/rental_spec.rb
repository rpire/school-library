require_relative 'spec_helper'

RSpec.describe Classroom do
  before :each do
    @student = Student.new(12, 'Luca', false)
    @teacher = Student.new(32, 'Marco')
    @book_a = Book.new('Harry Potter', 'J.K Rowling')
    @book_b = Book.new('The Lord of the Rings', 'J.R Tolkien')
    @rental_a = @student.rent('11/16/2021', @book_a)
    @rental_b = @book_b.rent('11/16/2021', @teacher)
    @rental_c = Rental.new('11/17/2021', @book_b, @teacher)
  end

  it 'Creates an instance of Rental' do
    @rental_c.should be_an_instance_of(Rental)
  end

  it 'Create a rental from a book' do
    @rental_b.should be_an_instance_of(Rental)
  end

  it 'Create a rental from a person' do
    @rental_a.should be_an_instance_of(Rental)
  end

  it 'Checks for the rentals of a book' do
    @book_b.rentals.length.should eql 2
  end

  it 'Checks for the rentals of a person' do
    @teacher.rentals.length.should eql 2
  end
end
