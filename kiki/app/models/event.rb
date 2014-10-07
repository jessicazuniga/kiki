class Event < ActiveRecord::Base
    belongs_to :group
    has_many :attendances
    has_many :comments
    has_many :related_events
    validates :name, presence: true, length: { minimum: 3 }
    validates :place, presence: true, length: { minimum: 3 }
    validates :time, presence: true

    before_validation :store_datetime

    def date_only
      time.strftime("%d/%m/%Y") if time.present?
    end 
    
    def time_only
      time.strftime("%I:%M%p") if time.present?
    end
    
    def date_only=(dd)
      # Change back to datetime friendly format
      @date_only = Date.parse(dd).strftime("%Y-%m-%d") if dd.present?
    end
    
    def time_only=(tt)
      # Change back to datetime friendly format
      @time_only = Time.parse(tt).strftime("%H:%M:%S") if tt.present?
    end
    
    def store_datetime
      self.time = DateTime.parse("#{@date_only} #{@time_only}") if @date_only.present? and @time_only.present? 
    end


    # def self.getNextEvents(time, num_days)
    #     start_time = time.beginning_of_day
    #     end_time = (time + num_days.days).end_of_day
    
    #     Event.where("time >= '#{start_time.to_s(:db)}' and time <= '#{end_time.to_s(:db)}'").order(:time)
    # end

    def self.getNextEventsAndAttendence(time, num_days, user_id = nil, group_id)

        start_time = time.beginning_of_day
        end_time = (time + num_days.days).end_of_day

        if user_id.nil?

            Event.where("time >= '#{start_time.to_s(:db)}' and time <= '#{end_time.to_s(:db)}' and group_id = '#{group_id}'").order(:time)

        else

            sql = """
                  SELECT e.*, a.response
                  FROM events e
                  LEFT OUTER JOIN
                  (select * from attendances t where t.user_id = ?) a
                  ON e.id = a.event_id
                  WHERE e.time >= ? and e.time <= ?
                    and e.group_id = ?
                  ORDER BY e.time
                  """
    
            Event.find_by_sql [ sql, user_id, start_time.to_s(:db), end_time.to_s(:db), group_id ]

        end
    
    end

end

