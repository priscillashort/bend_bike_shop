require 'date'

class Rental
  
  STANDARD_LATE_FEE = 5
  REDUCED_LATE_FEE = 3
  ACCEPTABLE_MINUTES_LATE = 30#Should remove the rental from the list of rentals
  CURRENT_DATE = Date.today.strftime("%m/%d/%y")
  CURRENT_TIME = Time.now.strftime("%I:%M%p")
  @@current_id = 0

  attr_accessor :bike, :customer, :time_frame, :late_fee,:called_if_late,:is_late, :confirmation_code
  
  def initialize(bike, customer, time_frame)
    @bike = bike
    @customer = customer
    @time_frame = time_frame
    @late_fee = 0
    @is_late = false
    @called_if_late = false
    @confirmation_code = @@current_id += 1
  end

  def to_s
    "Customer: #{self.customer.to_s}
  Rental model: #{bike.model} 
  Rental times: Starts on #{time_frame.start_date} at #{time_frame.start_time} and ends on #{time_frame.end_date} at #{time_frame.end_time}
  Confirmation code: #{confirmation_code}"
  end

  def calculate_late_fee(returned_time)
    if self.rental_time_exceeded?(returned_time)
      self.is_late = true
      self.late_fee = STANDARD_LATE_FEE
      self.reduce_late_fee
    end
    self.late_fee
  end

  def rental_time_exceeded?(returned_time)
    self.time_frame.get_end_time_diff(returned_time) >= ACCEPTABLE_MINUTES_LATE
  end

  def past_start_time?
    self.time_frame.get_start_time_diff(CURRENT_TIME) > 0
  end

  def past_start_date?
    time_frame.get_start_date_diff(CURRENT_DATE) > 0 
  end

  def on_start_date?
    time_frame.get_start_date_diff(CURRENT_DATE) == 0
  end

  def reduce_late_fee
    if self.called_if_late
      self.late_fee = REDUCED_LATE_FEE
    end
  end

  def payment_info
    self.customer.card_numb
  end

  def total
    self.bike.price + self.late_fee
  end

  def charge_customer
    # does something with payment_info and late fee
  end

  def cancelable?
    return (not past_start_time?) if on_start_date?
    not past_start_date?
  end

end