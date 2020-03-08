require_relative "rentable"

class Kayak 
  include Rentable

  def initialize(model)
    raise NotImplementedError, "The #{self.class} class should implement: initialize"
  end

end