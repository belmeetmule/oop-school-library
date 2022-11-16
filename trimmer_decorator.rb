require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    result = @nameable.correct_name
    result.length > 10 ? result[0, 10] : result
  end
end
