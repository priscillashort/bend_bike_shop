require 'date'

class Rental
  
  @@current_id = 0


  attr_accessor :bike, :customer, :time_frame, :confirmation_code
  
  def initialize(bike, customer, time_frame)
    @bike = bike
    @customer = customer
    @time_frame = time_frame
    @confirmation_code = (@@current_id += 1) 
    @confirmation_code = @@current_id += 1
  end

  def to_s
    "Customer: #{self.customer.to_s}
    Rental model: #{bike.model} 
    Rental times: Starts on #{time_frame.start_date} at #{time_frame.start_time} and ends on #{time_frame.end_date} at #{time_frame.end_time}
    Confirmation code: #{confirmation_code}"
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
    self.time_frame.get_current_vs_start_datetime_diff < 0
  end

  def change_rental_info(new_info)
    @customer = self.customer.change_info(new_info)
    @bike = self.bike.change_info(new_info)
    @time_frame = self.time_frame.change_info(new_info)
    return self
  end

  def late_fee(called_if_late)
    LateFee(self.time_frame, called_if_late).late_fee
  end

end