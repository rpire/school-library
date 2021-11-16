# rubocop:disable Metrics

module Storage
  def read_json_people
    people_json = File.read('./local/people.json')
    data_people = JSON.parse(people_json)
    data_people.each do |line|
      case line['type']
      when 'Student'
        create_student(line['age'], line['name'], true)
      else
        create_teacher('Default', line['age'], line['name'])
      end
    end
  end

  def read_json_books
    books_json = File.read('./local/books.json')
    data_books = JSON.parse(books_json)
    data_books.each { |book| create_book(book['title'], book['author']) }
  end

  def read_json_rentals
    rentals_json = File.read('./local/rentals.json')
    data_rentals = JSON.parse(rentals_json)
    data_rentals.each { |rental| create_rental(rental['book'], rental['index'], rental['date']) }
  end

  def save_json
    File.new('./local/books.json', 'a') unless File.exist?('./local/books.json') || @books.empty?
    File.new('./local/people.json', 'a') unless File.exist?('./local/people.json') || @people.empty?
    ppl = []
    bks = []
    rentals = []
    @people.each_with_index do |person, index|
      h = { name: person.name, age: person.age, type: person.class.name }
      unless person.rentals.empty?
        person.rentals.each do |rental|
          r = { index: index, book: @books.find_index(rental.book), date: rental.date }
          rentals.push(r)
        end
      end
      ppl.push(h)
    end
    @books.each do |book|
      h = { title: book.title, author: book.author }
      bks.push(h)
    end
    File.new('./local/rentals.json', 'a') unless File.exist?('./local/rentals.json') || rentals.empty?
    File.write('./local/books.json', JSON.dump(bks)) unless @books.empty?
    File.write('./local/people.json', JSON.dump(ppl)) unless @people.empty?
    File.write('./local/rentals.json', JSON.dump(rentals)) unless rentals.empty?
  end
end

# rubocop:enable Metrics
