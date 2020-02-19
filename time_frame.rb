class TimeFrame

    attr_reader :start_time, :end_time, :start_date, :end_date

    def initialize(start_date,end_date,start_time,end_time)
        @start_date = start_date
        @end_date = end_date
        @start_time = start_time
        @end_time = end_time
    end

    def get_time_diff(actual_return_time)
        return self.time_to_minutes(actual_return_time - self.end_time)
    end

    def convert_to_miltary(time)
        hours,minutes = time.split(':')
        hours = hours.to_i
        am_or_pm = minutes[/\D+/].upcase
        hours -= 12 if hours == 12
        hours += 12 if am_or_pm == "PM"
        return hours,minutes[/\d+/].to_i
    end

    def time_to_minutes(time)
        hours,minutes = convert_to_miltary(time) 
        hours*60 + minutes
    end

end


# main
puts TimeFrame.new(1,1,1,1).time_to_minutes("12:15PM")