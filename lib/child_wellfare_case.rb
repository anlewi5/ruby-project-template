class ChildWellfareCase

  attr_reader :minor, :age, :zip

  def initialize(minor, age, address)
    @minor = minor
    @age = age
    @address = address
    @zip = address[-5..-1]
  end

end
