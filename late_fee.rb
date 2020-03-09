require_relative "rental"
require_relative "time_frame"

class LateFee

  STANDARD_LATE_FEE = 5
  REDUCED_LATE_FEE = 3
  ACCEPTABLE_MINUTES_LATE = 30

  attr_accessor :returned_time, :returned_date, :time_frame, :called_if_late, :amount, :is_late

  def initialize(returned_time, returned_date, time_frame, called_if_late=false)
    @returned_time = returned_time
    @returned_date = returned_date
    @time_frame = time_frame
    @called_if_late = false
    @amount = 0
    @is_late = false

    calculate_late_fee(returned_date, returned_time)
  end

  def calculate_late_fee(returned_date, returned_time)
    if rental_datetime_exceeded?(returned_date,returned_time)
      @is_late = true
      @amount = STANDARD_LATE_FEE
      reduce_late_fee()
    end
  end

  def rental_datetime_exceeded?(returned_date, returned_time)
    @time_frame.get_end_datetime_diff(returned_date,returned_time) > ACCEPTABLE_MINUTES_LATE
  end

  def reduce_late_fee
    if @called_if_late
      @amount = REDUCED_LATE_FEE
    end
  end

end

class NilLateFee
  def calculate_late_fee
    raise "Late fee can not be calculated on NilLateFee object"
  end
end


