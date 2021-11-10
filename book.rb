require_relative 'rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :book

  attr_reader :rentals

  def rent(date, person)
    Rental.new(date, self, person)
  end
end
