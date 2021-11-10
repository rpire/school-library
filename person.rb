require_relative 'corrector'
require_relative 'rental'

class Person
  DEFAULT_BOOL = true

  def initialize(age, name = 'Unknown', parent_permission = DEFAULT_BOOL)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []

    @corrector = Corrector.new
  end

  attr_accessor :name, :age

  attr_reader :id, :rentals

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def rent(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    age >= 18
  end
end
