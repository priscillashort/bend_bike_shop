require_relative "rentable"

class Bike 
  include Rentable

  attr_reader :model
  
  def initialize(model)
    @model = model
  end
  
  #def price
	#	raise NotImplementedError, "The #{self.class} class should implement: price"
  #end

  #def weight
	#	raise NotImplementedError, "The #{self.class} class should implement: weight"
  #end

end