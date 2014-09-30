

# open and parse calendar
cal_file = File.open("tools/ca_mom_cal.ics")
cals = Icalendar.parse(cal_file)
cal = cals.first

cal.events.each { |e|
    event_time = e.dtstart.in_time_zone("Pacific Time (US & Canada)")
    if event_time > Time.zone.now
        puts e.dtstart.in_time_zone("Pacific Time (US & Canada)")
        puts e.summary
        puts e.location
        puts e.description
        puts "––––––––––––––––"
        Event.create(name: e.summary.to_s, time: event_time, place: e.location.to_s, description: e.description.to_s, group_id: 3)
    end
}




#Create sample events data
#x = 0
#t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,16,30,0)
#Event.create(name: 'Food Trucks', time: t, place: 'Mountain View', description: 'Get food.', group_id:1)
#
#x = 0
#t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,10,30,0)
#Event.create(name: 'Play date', time: t, place: 'Mountain View', description: 'Come to our house for a play date.', group_id:1)
#