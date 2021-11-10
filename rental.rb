class Rental
  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end

  attr_accessor :date

  attr_reader :book, :person
end
