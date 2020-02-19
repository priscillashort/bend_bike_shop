
class Rental
  
  STANDARD_LATE_FEE = 5
  REDUCED_LATE_FEE = 3
  ACCEPTABLE_MINUTES_LATE = 30

  attr_accessor :bike, :customer, :time_frame
  
  def initialize(bike, customer, time_frame)
    @bike = bike
    @customer = customer
    @time_frame = time_frame
    @late_fee = 0
    @is_late = false
    @called_if_late = false
  end

  def to_s
    self.customer.to_s
  end

  def late_fee(time_frame)
    if self.time_frame.get_time_diff() > ACCEPTABLE_MINUTES_LATE
      self.is_late = true
      self.late_fee = STANDARD_LATE_FEE
      self.reduce_late_fee
    end
  end

  def reduce_late_fee()
    if called_if_late
      self.late_fee = REDUCED_LATE_FEE
    end
  end

end

