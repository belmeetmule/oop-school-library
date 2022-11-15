class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end
end

person = Person.new(18, 'mulugeta')
puts person.id
puts person.name
puts person.age
