require 'date'
require_relative "late_fee.rb"

class Rental
  
  @@current_id = 0

  attr_accessor :rentable, :customer, :time_frame, :confirmation_code

  def initialize(rentable, customer, time_frame)
    @rentable = rentable
    @customer = customer
    @time_frame = time_frame
    @confirmation_code = (@@current_id += 1)
    @late_fee = nil 
  end

  def to_s
    "Customer: #{self.customer.to_s}
    Rental type: #{rentable.class_description} 
    Rental times: Starts on #{time_frame.start_date} at #{time_frame.start_time} and ends on #{time_frame.end_date} at #{time_frame.end_time}
    Confirmation code: #{confirmation_code}"
  end

  def payment_info
    self.customer.card_numb
  end

  def total
    self.rentable.price + self.late_fee
  end

  def charge_customer
    # does something with payment_info and late fee
  end

  def cancelable?
    self.time_frame.get_current_vs_start_datetime_diff < 0
  end

  def change_rental_info(new_info)
    @customer = self.customer.change_info(new_info)
    @rentable = self.rentable.change_info(new_info)
    @time_frame = self.time_frame.change_info(new_info)
    return self
  end

  def create_late_fee(returned_time, returned_date, called_if_late=false)
    @late_fee = LateFee.new(returned_time, returned_date, @time_frame, called_if_late)
  end

  def late_fee
    @late_fee.amount
  end

  def is_late
    @late_fee.is_late
  end

end