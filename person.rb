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
  	# foo.join(",")
  	# foo.to_a
  end

  def friendslist(a)
  	# hobbiesArray = []
  	# a.map { |p| hobbiesArray += hobbies & p.hobbies}
  	# hobbiesArray

  	hobbiesArray = a.permutation(2).to_a
  	gh = hobbiesArray.map {|p| p.first.commonHobbies(p.last)}
  	cd = gh.reject { |h|  h.empty? }

  end

end
