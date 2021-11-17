require_relative 'spec_helper'

RSpec.describe Student do 
    before :each do
        @student = Student.new(19,'Marco',false)
        @classroom = Classroom.new('Maths')
    end   
    it "Takes three parameters and returns a Student object" do        
        @student.should be_an_instance_of Student    
    end

    it "Check for the age of the student" do        
        @student.age.should eql 19
    end

    it "Check for the name of the person" do        
        @student.name.should eql 'Marco'    
    end

    it "Student is able to play hooky" do  
        @student.play_hooky.should eql '"¯\(ツ)/¯"'
    end

    it "Student is able to join a classroom" do  
        @student.classroom = @classroom
        @student.classroom.label.should eql 'Maths'
    end
end