# rubocop:disable Lint/MissingCopEnableDirective
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    prompt_user
  end

  def quit_app
    puts 'Exiting...'
    puts 'Thank you for using this app!'
    exit
  end

  # Person: Student /Teacher
  def list_all_people
    if @people.empty?
      puts 'The people list is empty, add some people...'
    else
      puts "People's list, count(#{@people.count}) :\n\n"
      @people.each_with_index do |person, index|
        puts "#{index + 1}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}, Type: #{person.type}"
      end
    end
  end

  def create_person
    puts 'Which do you want to create? A student (press 1) or a teacher (press 2)?'
    choice = gets.chomp.to_i
    case choice
    when 1
      register_student
    when 2
      register_teacher
    else
      puts 'Incorrect choice, choose a number between 1..2'
      create_person
    end
  end

  def register_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Classroom:'
    classroom = gets.chomp

    print 'Name: '
    name = gets.chomp

    has_permission = permission?

    student = Student.new(classroom, age, name: name, parent_permission: has_permission)
    @people << student unless @people.include?(student)

    puts "The student '#{name}' aged '#{age}' with the classroom '#{classroom}' was created successfully!!"
  end

  def register_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Specialization: '
    specialization = gets.chomp

    print 'Name: '
    name = gets.chomp

    teacher = Teacher.new(specialization, age, name)
    @people << teacher unless @people.include?(teacher)

    puts "The teacher '#{name}' aged '#{age}' with specialization in '#{specialization}' was created successfully!!"
  end

  def permission?
    print 'Has parent permission? [Y/N]:'
    permission = gets.chomp

    case permission
    when 'n', 'N'
      false
    when 'y', 'Y'
      true
    else
      puts 'Incorrect choice, kindly enter only [\'y\' or \'Y\' or \'n\' or \'N\'] '
      permission?
    end
  end

  # Books
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book unless @books.include?(book)

    puts "The book '#{title}' by #{author} was created successfully!!"
  end

  def list_all_books
    if @books.empty?
      puts 'The book list is empty, add some books...'
    else
      puts "Books list, count(#{@books.count}):\n\n"
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: '#{book.title}', Author: #{book.author}"
      end
    end
  end

  # Rentals
  def create_rental
    print "Select a book from the following list by number:\n"
    list_all_books
    prompt_user if @books.empty?
    book_index = gets.chomp.to_i - 1

    print "Select a person from the following list by number:\n"
    list_all_people
    prompt_user if @people.empty?
    person_index = gets.chomp.to_i - 1

    print 'Date [yyyy/mm/dd] : '
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental unless @rentals.include?(rental)

    puts 'Rental created successfully!'
  end

  # List_rentals
  def list_rentals_by_id
    print "Enter a person's ID: "
    person_id = gets.chomp.to_i
    if !@people.find { |person| person.id == person_id }
      puts "No rental found with ID: #{person_id}"
    elsif @rentals.empty?
      puts 'The rental list is empty, add some rentals...'
    else
      puts "Rentals list, count(#{@people.count}) :\n\n"
      @rentals.each do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
        end
      end
    end
  end
end
