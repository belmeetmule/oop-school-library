class Person
  def initialize(age, name = "unknown", parent_permission = true)
    @id = Random.rand(1..100)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :name
  attr_accessor :age

  def is_of_age?
    if @age >= 18
      true
    else
      false
    end
  end

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    else
      false
    end
  end
end

person = Person.new(18, "mulugeta");
puts person.id
puts person.name
puts person.age
