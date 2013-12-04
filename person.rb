class Person
  attr_accessor :name, :hobbies

  def initialize(params = {})
  	@name = params[:name]
  	@hobbies = params[:hobbies]

  end

  def hobbies
  	@hobbies.split(",")
  end

  def hash

  end

end
