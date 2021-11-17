require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end
  attr_reader :specialization

  def can_use_services?
    true
  end
end
