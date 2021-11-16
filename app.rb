require 'json'

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

  def create_person(decision, age, name)
    case decision
    when 1
      create_student_input(age, name)
    else
      create_teacher_input(age, name)
    end
    puts
  end

  def create_book(title, author)
    @books << Book.new(title, author)
    puts
    puts 'Book created successfully'
    puts
  end

  def create_rental(book_index, person_index, date)
    Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
    puts
  end

  def display_rentals(person_input)
    renter = @people.select { |person| person.id == (person_input) }
    if renter.empty?
      puts 'No rentals found for this ID'
      user_rental_id_input
    else
      puts renter
      puts "Rentals of #{renter.first.name}:"
      puts 'EMPTY' if renter.first.rentals.empty?
      puts(renter.first.rentals.map { |rental| "Book: #{rental.book.title}, Rented on: #{rental.date}" })
      enter_msg
    end
  end

  def read_json_people
    unless !File.exist?('./local/people.json')
      people_json = File.read('./local/people.json') 
      data_people = JSON.parse(people_json)
      puts data_people[0]['name']
      data_people.each_with_index {|line,index|
        case line['type']
        when 'Student'
          create_student(line['age'],line['name'],true)
        else
          create_teacher('Default',line['age'],line['name'])
        end 
        puts "Index #{index} contains: name #{line['type']}"}
    else 
      puts 'File doesnt exist'
    end
  end

  def save_json
    f = File.new('./local/books.json', 'a') unless File.exist?('./local/books.json') || @books.empty?
    f1 = File.new('./local/people.json', 'a') unless File.exist?('./local/people.json') || @people.empty?
    ppl = []
    bks = []
    rentals = []
    @people.each {|person|
      h = {'name': person.name, 'age': person.age, 'type': person.class.name}
      unless person.rentals.empty?
        person.rentals.each {|rental|
            r = {'name': rental.person.name, 'book': rental.book.title, 'date':rental.date}
            rentals.push(r)      
        }
      end
      ppl.push(h)
    }
    @books.each {|book|
      h = {'title': book.title, 'author': book.author}
      bks.push(h)
    }
    f2 = File.new('./local/rentals.json', 'a') unless File.exist?('./local/rentals.json') || rentals.empty?
    File.write('./local/books.json', JSON.dump(bks)) unless @books.empty?
    File.write('./local/people.json', JSON.dump(ppl))unless @people.empty?
    File.write('./local/rentals.json', JSON.dump(rentals)) unless rentals.empty?

  end

  private

  def create_student(age, name, permission)
    @people << Student.new(age, name, permission)
  end

  def create_teacher(specialty, age, name)
    @people << Teacher.new(specialty, age, name)
  end
end
