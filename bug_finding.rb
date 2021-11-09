require_relative 'student'
require_relative 'teacher'

student = Student.new('1-A', 17, 'bartholomew', false)
shota = Teacher.new('Programming', 34, 'constantine')

puts 'Student information:'
puts
puts "Name: #{student.name}"
puts "Age: #{student.age}"
puts "ID: #{student.id}"
puts "Service usage available: #{student.can_use_services?}"
puts student.play_hooky
student.validate_name
puts "Corrected name: #{student.name}"
puts

puts
puts 'Teacher information:'
puts
puts "Name: #{shota.name}"
puts "Age: #{shota.age}"
puts "ID: #{shota.id}"
puts "Service usage available: #{shota.can_use_services?}"
shota.validate_name
puts "Corrected name: #{shota.name}"
