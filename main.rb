require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'
require_relative 'app'

class Main
  include App

  def initialize
    @main_ans = 0
    @books = []
    @people = []

    puts 'Welcome to School Library App!'
    puts
  end

  def show_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'
    print INPT_MSG
  end

  def select_option
    case @main_ans
    when 1
      display_books
      enter_msg
    when 2
      display_people
      enter_msg
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental unless @books.empty? && @people.empty?
    when 6
      display_rentals
    else
      if @main_ans != 7
        puts 'Invalid input, please try again'
        puts
      end
    end
  end

  def main
    until @main_ans == 7
      show_options
      @main_ans = gets.chomp.to_i
      puts
      select_option
    end
    puts 'Exiting session'
    puts 'Thank you for using the Library School App!'
  end
end

Main.new.main
