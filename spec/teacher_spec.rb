require_relative 'spec_helper'

RSpec.describe Teacher do
  before :each do
    @teacher = Teacher.new('Physics', 45, 'Ms Smith')
  end
  it 'Takes three parameters and returns a Teacher object' do
    @teacher.should be_an_instance_of Teacher
  end

  it 'Check for the specialization of the teacher' do
    @teacher.specialization.should eql 'Physics'
  end

  it 'Check for the age of the teacher' do
    @teacher.age.should eql 45
  end

  it 'Check for the name of the teacher' do
    @teacher.name.should eql 'Ms Smith'
  end

  it 'Can user services is always true' do
    @teacher.can_use_services?.should be_truthy
  end
end
