require_relative 'person'

class Student < Person
  DEFAULT_BOOL = true
  def initialize(age, name = 'Unknown', parent_permission = DEFAULT_BOOL)
    super(age, name, parent_permission)
  end

  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '"¯\(ツ)/¯"'
  end
end
