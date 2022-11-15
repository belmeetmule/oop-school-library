require "./person.rb"

class Student < Person
  def initialize(classroom, age, name = "unknown", parent_permission = true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

person = Student.new("10th A", 18, "mulugeta", true);
puts person.id
puts person.name
puts person.age
puts person.play_hooky
