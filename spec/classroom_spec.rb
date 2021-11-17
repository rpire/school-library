require_relative 'spec_helper'

RSpec.describe Classroom do
  before :each do
    @student_a = Student.new(12, 'luca', false)
    @student_b = Student.new(18, 'Marco', true)
    @classroom = Classroom.new('Math')
    @classroom.add_student(@student_a)
    @classroom.add_student(@student_b)
  end

  it 'Creates a classroom' do
    @classroom.should be_an_instance_of(Classroom)
  end

  it 'Adds two students' do
    @classroom.students.length.should eql 2
  end

  it 'Checks for the student A information' do
    @classroom.students.first.name.should eql 'luca'
  end
end
