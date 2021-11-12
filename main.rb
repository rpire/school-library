require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  INPT_MSG = 'Enter an option number here --> '.freeze
  ENTR_MSG = 'Press ENTER to continue'.freeze

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
    when 2
      display_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      display_rentals
    else
      puts 'Exiting session'
      puts 'Thank you for using School Library App!'
    end
  end

  def main
    until @main_ans == 7
      show_options
      @main_ans = gets.chomp.to_i
      puts
      select_option
    end
  end

  def display_books
    puts 'List of books:'
    puts 'EMPTY' if @books.empty?
    puts(@books.map { |book| "Title: #{book.title}, Author: #{book.author}" })
    print ENTR_MSG
    gets
    puts
  end

  def display_people
    puts 'List of people:'
    puts 'EMPTY' if @people.empty?
    puts(@people.map { |person| "[#{person.class}] - Name: #{person.name}, Age: #{person.age}, ID: #{person.id}" })
    print ENTR_MSG
    gets
    puts
  end

  def create_person
    puts 'Do you want to create a student (1), or a teacher (2)'
    print INPT_MSG
    case gets.chomp.to_i
    when 1
      create_student
    when 2
      create_teacher
    else
      puts
      puts 'Invalid input, please try again'
      puts
      create_person
    end
    puts
  end

  def create_book
    puts 'Please, enter book information below:'
    print 'Title --> '
    title = gets.chomp
    print 'Author --> '
    author = gets.chomp
    @books << Book.new(title, author)
    puts
    puts 'Book created successfully'
    puts
  end

  def create_rental
    puts 'Select a book from the following list:'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    print INPT_MSG
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person form the following list:'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
    print INPT_MSG
    person_index = gets.chomp.to_i
    puts
    print 'Enter date of retrieval --> '
    date = gets.chomp
    Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
    puts
  end

  def display_rentals
    print 'Enter the person\'s ID --> '
    person_id = gets.chomp.to_i
    renter = @people.select { |person| person.id == person_id }
    puts
    puts "Rentals of #{renter.first.name}:"
    puts 'EMPTY' if renter.first.rentals.empty?
    puts(renter.first.rentals.map { |rental| "Book: #{rental.book.title}, Rented on: #{rental.date}" })
    print ENTR_MSG
    gets
    puts
  end

  private

  def create_student
    print 'Age --> '
    age = gets.chomp.to_i
    print 'Name --> '
    name = gets.chomp
    print 'Has parent permission? [Y/N] --> '
    permission = gets.chomp.upcase
    permission = permission != 'N'
    @people << Student.new(age, name, permission)
    puts 'Student created successfully'
    puts
  end

  def create_teacher
    print 'Age --> '
    age = gets.chomp.to_i
    print 'Name --> '
    name = gets.chomp
    print 'Specialty --> '
    specialty = gets.chomp
    @people << Teacher.new(specialty, age, name)
    puts
    puts 'Teacher created successfully'
    puts
  end
end

App.new.main
