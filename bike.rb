require_relative "rentable"

class Bike 
  include Rentable
  
  def initialize(model)
    raise NotImplementedError, "The #{self.class} class should implement: initialize"
  end

end