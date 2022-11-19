require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permission: true, type: 'Teacher')
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
    @type = type
  end

  attr_reader :specialization, :type

  def can_use_services?
    true
  end
end
