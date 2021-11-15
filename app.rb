module App
  INPT_MSG = 'Enter an option number here --> '.freeze
  ENTR_MSG = 'Press ENTER to continue'.freeze

  def enter_msg
    print ENTR_MSG
    gets
    puts
  end

  def display_books
    puts 'List of books:'
    puts 'EMPTY' if @books.empty?
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
  end

  def display_people
    puts 'List of people:'
    puts 'EMPTY' if @people.empty?
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def create_person
    decision = 0
    until [1, 2].include?(decision)
      puts 'Do you want to create a student (1), or a teacher (2)?'
      print INPT_MSG
      decision = gets.chomp.to_i
      if ![1, 2].include?(decision)
        puts
        puts 'Invalid input, please try again'
        puts
      end
    end
    print 'Age --> '
    age = gets.chomp.to_i
    print 'Name --> '
    name = gets.chomp
    case decision
    when 1
      create_student(age, name)
    else
      create_teacher(age, name)
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
    display_books
    print INPT_MSG
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person form the following list:'
    display_people
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
    display_people
    person_id = gets.chomp.to_i
    renter = @people.select { |person| person.id == person_id }
    puts
    puts "Rentals of #{renter.first.name}:"
    puts 'EMPTY' if renter.first.rentals.empty?
    puts(renter.first.rentals.map { |rental| "Book: #{rental.book.title}, Rented on: #{rental.date}" })
    enter_msg
  end

  private

  def create_student(age, name)
    print 'Has parent permission? [Y/N] --> '
    permission = gets.chomp.upcase
    permission = permission != 'N'
    @people << Student.new(age, name, permission)
    puts 'Student created successfully'
    puts
  end

  def create_teacher(age, name)
    print 'Specialty --> '
    specialty = gets.chomp
    @people << Teacher.new(specialty, age, name)
    puts
    puts 'Teacher created successfully'
    puts
  end
end
