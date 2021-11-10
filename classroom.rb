class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  attr_accessor :label

  attr_reader :students

  def add_student(student)
    @students.push(student) unless @students.include?(student)
    student.classroom = self
  end
end
