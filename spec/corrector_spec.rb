require_relative 'spec_helper'

RSpec.describe Classroom do
  before :each do
    @corrector = Corrector.new
  end

  it 'Corrects a long name' do
    @corrector.correct_name('Bartholomew').should eql 'Bartholome'
  end

  it 'Corrects capitalization' do
    @corrector.correct_name('luca').should eql 'Luca'
  end

  it 'Corrects capitalization and length' do
    @corrector.correct_name('constantine').should eql 'Constantin'
  end
end
