require_relative "kayak"

class FlatwaterKayak < Kayak
  #attr_reader :weight, :model
  
  #def initialize(weight, model)
  #  @weight = weight
  #  @model = model
  #end
  
  def price
    20
  end

  def weight
    10
  end

end