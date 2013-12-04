require "./UnknownAttributeError"

class Person
  attr_accessor :name, :hobbies

  def initialize(params = {})
  	if params.length == 2
  		@name = params[:name]
  		@hobbies = params[:hobbies]
  	elsif params.length > 2
  		raise UnknownAttributeError.new()
  	end
  	
  end

  def hobbies
  	@hobbies.split(",")
  end

  def commonHobbies(p2)
  	foo = hobbies & p2.hobbies

  end

end
