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

  def friendslist(a)
    returnArray = []
    a.combination(2){ |p|
      foo = p[0].commonHobbies(p[1])
      if foo.length > 0
        returnArray.push([foo.length, foo.join(", "), p[0].name, p[1].name])
      end
    }
    returnArray
  end

end
