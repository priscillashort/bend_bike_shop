class TimeFrame

  attr_reader :start_time, :end_time, :start_date, :end_date  

  def initialize(start_date,end_date,start_time,end_time)
      @start_date = start_date
      @end_date = end_date
      @start_time = start_time
      @end_time = end_time
  end  

  def get_start_datetime_diff(compare_date,compare_time)
    hours_to_min(days_to_hours(get_start_date_diff(compare_date))) + get_start_time_diff(compare_time)
  end

  def get_end_datetime_diff(compare_date,compare_time)
    hours_to_min(days_to_hours(get_end_date_diff(compare_date))) + get_end_time_diff(compare_time)
  end

  private 

  def get_end_time_diff(compare_time)
    time_to_minutes(compare_time) - time_to_minutes(end_time)
  end  

  def get_start_time_diff(compare_time)
    time_to_minutes(compare_time) - time_to_minutes(start_time)
  end

  def get_start_date_diff(compare_date)
    get_date_diff(start_date,compare_date)
  end

  def get_end_date_diff(compare_date)
    get_date_diff(end_date,compare_date)
  end
  
  def get_date_diff(date, compare_date)
    to_date_obj(compare_date).jd - to_date_obj(date).jd
  end 

  def time_to_minutes(time)
    hours,minutes = convert_to_miltary(time).split(':').map{|t|t.to_i}
    hours_to_min(hours) + minutes
  end

  def convert_to_miltary(time)
    hours,minutes_and_ampm = time.split(':')
    hours = hours.to_i
    hours -= 12 if hours == 12
    hours += 12 if minutes_and_ampm[/[a-zA-Z]+/].upcase == "PM"
    "#{hours}:#{minutes_and_ampm[/\d+/]}"
  end 

  def to_date_obj(date_str)
    Date.strptime(date_str,"%m/%d/%y")
  end

  def days_to_hours(days)
    24*days
  end

  def hours_to_min(hours)
    60*hours
  end

end


