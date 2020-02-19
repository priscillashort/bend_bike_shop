class Time_frame

    attr_reader :start_time, :end_time, :start_date, :end_date

    def initialize(start_date,end_date,start_time,end_time)
        @start_date = start_date
        @end_date = end_date
        @start_time = start_time
        @end_time = end_time
    end
end