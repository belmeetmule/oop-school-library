require './person'

class Student < Person
  def initialize(classroom, age, name: 'unknown', parent_permission: true, type: 'Student')
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    @type = type
  end

  attr_reader :classroom, :type

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
