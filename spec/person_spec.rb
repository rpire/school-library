require_relative 'spec_helper'

RSpec.describe Person do
  before :each do
    @person = Person.new(12, 'luca', false)
  end
  it 'Takes three parameters and returns a Person object' do
    @person.should be_an_instance_of Person
  end

  it 'Check for the age of the person' do
    @person.age.should eql 12
  end

  it 'Check for the name of the person' do
    @person.name.should eql 'luca'
  end

  it 'Check for the parent permission of the person' do
    @person.parent_permission.should be_falsey
  end

  it 'Name validator works properly' do
    @person.validate_name.should eql 'Luca'
  end

  it 'Age validator works properly' do
    @person.can_use_services?.should be_falsey
  end
end
