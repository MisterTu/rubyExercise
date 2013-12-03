
class Person
  attr_accessor :name, :hobbies
  def initialize(name,hobbies)
  	@name, @hobbies = name, hobbies.split(",")
  end

end
