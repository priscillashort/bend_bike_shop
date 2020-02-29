class TimeFrame

  attr_reader :start_time, :end_time, :start_date, :end_date  

  def initialize(start_date,end_date,start_time,end_time)
      @start_date = start_date
      @end_date = end_date
      @start_time = start_time
      @end_time = end_time
  end  

  def get_time_diff(actual_return_time)
      self.time_to_minutes(actual_return_time) - self.time_to_minutes(self.end_time)
  end  

  def convert_to_miltary(time)
      hours,minutes_and_ampm = time.split(':')
      hours = hours.to_i
      hours -= 12 if hours == 12
      hours += 12 if minutes_and_ampm[/\w+/].upcase == "PM"
      "#{hours}:#{minutes_and_ampm[/\d+/]}"
  end  

  def time_to_minutes(time)
      hours,minutes = convert_to_miltary(time).split(':').map{|t|t.to_i}
      hours*60 + minutes
  end

  def change_info(new_info)
    @start_date = new_info[:start_date] if new_info.key?(:start_date)
    @end_date = new_info[:end_date] if new_info.key?(:end_date)
    @start_time = new_info[:start_time] if new_info.key?(:start_time)
    @end_time = new_info[:end_time] if new_info.key?(:end_time)
    return self
  end

end


# tests
# puts TimeFrame.new(1,1,1,"3:45PM").get_time_diff("9:00pm")

