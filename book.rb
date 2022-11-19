class Book
  def initialize(title, author)
    @id = Random.new.rand(1..100)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author
  attr_reader :rentals, :id

  def add_rental(person, date)
    Rental.new(person, date, self)
  end
end
