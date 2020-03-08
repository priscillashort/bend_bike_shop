require_relative "rental"

class LateFee
  STANDARD_LATE_FEE = 5
  REDUCED_LATE_FEE = 3
  ACCEPTABLE_MINUTES_LATE = 30

  attr_accessor :time_frame, :called_if_late, :late_fee, :is_late

  def initialize(time_frame, called_if_late)
    @time_frame = time_frame
    @called_if_late = false
    @amount = 0
    @is_late = false

    calculate_late_fee(@time_frame.return_date, @time_frame.returned_time)

  end

  def calculate_late_fee(return_date, returned_time)
    if self.rental_datetime_exceeded?(return_date,returned_time)
      self.is_late = true
      self.amount = STANDARD_LATE_FEE
      self.reduce_late_fee()
    end
  end

  def rental_datetime_exceeded?(returned_date, returned_time)
    self.time_frame.get_end_datetime_diff(returned_date,returned_time) > ACCEPTABLE_MINUTES_LATE
  end

  def reduce_late_fee
    if self.called_if_late
      self.amount = REDUCED_LATE_FEE
    end
  end

end


