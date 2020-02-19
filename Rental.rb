class Rental

  attr_accessor :customer, :time_frame, :bike

  def initialize(customer, time_frame, bike)
    @customer = customer
    @time_frame = time_frame
    @bike = bike
  end

  def to_s
    "Name: #{customer.first_name} #{customer.last_name} 
Rental model: #{bike.model} 
Rental times: Starts on #{time_frame.start_date} at #{time_frame.start_time} and ends on #{time_frame.end_date} at #{time_frame.end_time}"
  end

end