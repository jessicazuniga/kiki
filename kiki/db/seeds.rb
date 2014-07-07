# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create sample events data
x = 0
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,16,30,0)
Event.create(name: 'Food Trucks', time: t, place: 'Mountain View', description: 'Get food.')

x = 0
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,10,30,0)
Event.create(name: 'Play date', time: t, place: 'Mountain View', description: 'Come to our house for a play date.')

x = 0
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,18,30,0)
Event.create(name: 'Games in park', time: t, place: 'Pretty park', description: 'Play games at the park.')

x = 1
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,12,00,0)
Event.create(name: 'Walk in park', time: t, place: 'Palo Alto', description: 'Take a stroll.')

x = 2
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,11,30,0)
Event.create(name: 'Water babies', time: t, place: 'Menlo Park', description: 'Swim with your kids.')

x = 2
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,10,00,0)
Event.create(name: 'Blanket Babies at Pardee Park', time: t, place: 'Palo Alto', description: 'Get kids together.')

x = 2
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,17,15,0)
Event.create(name: 'Fire truck tour', time: t, place: 'Mountain View', description: 'Take a tour of fire truck.')

x = 3
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,13,10,0)
Event.create(name: 'Pool', time: t, place: 'Mountain View', description: 'Fun in pool.')

x = 4
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,11,00,0)
Event.create(name: 'Zoo', time: t, place: 'Palo Alto', description: 'Go see monkeys.')

x = 5
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,10,30,0)
Event.create(name: 'Blanket babies', time: t, place: 'Menlo Park', description: 'babies with blankets')

x = 6
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,12,00,0)
Event.create(name: 'Lunch at Copa', time: t, place: 'Palo Alto', description: 'Have lunch together.')

x = 6
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,14,00,0)
Event.create(name: 'Bumble brunch', time: t, place: 'Menlo Park', description: 'Rinconada park outing.')

x = 7
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,11,30,0)
Event.create(name: 'Water babies', time: t, place: 'Palo Alto', description: 'Go swiming with the kids.')

