# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create sample groups data
Group.create(name: 'CA Moms demo', description: 'group of mothers who like to get together in the peninsula')
Group.create(name: 'School Class', description: 'class group')
Group.create(name: 'CA Moms', description: 'group of mothers who like to get together in the peninsula')


#Create sample events data
x = 0
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,16,30,0)
Event.create(name: 'Food Trucks', time: t, place: 'Mountain View', description: 'Get food.', group_id:1)

x = 0
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,10,30,0)
Event.create(name: 'Play date', time: t, place: 'Mountain View', description: 'Come to our house for a play date.', group_id:1)

x = 0
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,18,30,0)
Event.create(name: 'Games in park', time: t, place: 'Pretty park', description: 'Play games at the park.', group_id:1)

x = 1
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,12,00,0)
Event.create(name: 'Walk in park', time: t, place: 'Palo Alto', description: 'Take a stroll.', group_id:1)

x = 2
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,11,30,0)
Event.create(name: 'Water babies', time: t, place: 'Menlo Park', description: 'Swim with your kids.', group_id:1)

x = 2
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,10,00,0)
Event.create(name: 'Blanket Babies at Pardee Park', time: t, place: 'Palo Alto', description: 'Get kids together.', group_id:1)

x = 2
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,17,15,0)
Event.create(name: 'Fire truck tour', time: t, place: 'Mountain View', description: 'Take a tour of fire truck.', group_id:1)

x = 3
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,13,10,0)
Event.create(name: 'Pool', time: t, place: 'Mountain View', description: 'Fun in pool.', group_id:1)

x = 4
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,11,00,0)
Event.create(name: 'Zoo', time: t, place: 'Palo Alto', description: 'Go see monkeys.', group_id:1)

x = 5
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,10,30,0)
Event.create(name: 'Blanket babies', time: t, place: 'Menlo Park', description: 'babies with blankets', group_id:1)

x = 6
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,12,00,0)
Event.create(name: 'Lunch at Copa', time: t, place: 'Palo Alto', description: 'Have lunch together.', group_id:1)

x = 6
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,14,00,0)
Event.create(name: 'Bumble brunch', time: t, place: 'Menlo Park', description: 'Rinconada park outing.', group_id:1)

x = 7
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,11,30,0)
Event.create(name: 'Water babies', time: t, place: 'Palo Alto', description: 'Go swiming with the kids.', group_id:1)


x = 0
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,16,30,0)
Event.create(name: 'PTA meeting', time: t, place: 'Mountain View', description: 'Talk to teachers.', group_id:2)

x = 0
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,5,00,0)
Event.create(name: 'Mati\'s birthday party', time: t, place: 'Palo Alto', description: 'Come celebrate Mati\'s birthday.', group_id:2)

x = 1
t = DateTime.new(x.day.from_now.year, x.day.from_now.month, x.day.from_now.day,18,30,0)
Event.create(name: 'Soccer team meeting', time: t, place: 'Soccer field in school', description: 'Meet new soccer coach.', group_id:2)


#Create sample users data
User.create!(name: 'Jessica', email: 'jessica@email.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Gabor', email: 'gabor@email.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Mati', email: 'mati@email.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Peter', email: 'peter@email.com', password: 'password', password_confirmation: 'password')
User.create(name: 'Mary', email: 'mary@email.com', password: 'password', password_confirmation: 'password')

#Create sample attendances data
Attendance.create(response: TRUE, user_id: 1, event_id: 2)
Attendance.create(response: TRUE, user_id: 1, event_id: 3)
Attendance.create(response: TRUE, user_id: 1, event_id: 4)

Attendance.create(response: TRUE, user_id: 2, event_id: 1)
Attendance.create(response: FALSE, user_id: 2, event_id: 2)
Attendance.create(response: TRUE, user_id: 2, event_id: 3)

Attendance.create(response: TRUE, user_id: 3, event_id: 3)
Attendance.create(response: TRUE, user_id: 3, event_id: 5)
Attendance.create(response: TRUE, user_id: 3, event_id: 7)

Attendance.create(response: TRUE, user_id: 4, event_id: 8)
Attendance.create(response: TRUE, user_id: 4, event_id: 9)
Attendance.create(response: FALSE, user_id: 4, event_id: 10)

Attendance.create(response: TRUE, user_id: 5, event_id: 10)
Attendance.create(response: TRUE, user_id: 5, event_id: 11)
Attendance.create(response: TRUE, user_id: 5, event_id: 12)

Attendance.create(response: TRUE, user_id: 5, event_id: 13)
Attendance.create(response: TRUE, user_id: 3, event_id: 14)
Attendance.create(response: TRUE, user_id: 2, event_id: 14)
Attendance.create(response: TRUE, user_id: 4, event_id: 15)
Attendance.create(response: TRUE, user_id: 1, event_id: 15)


#Create sample comments data
Comment.create(text: 'I will be there with the Kiki.', user_id: 1, event_id:1)
Comment.create(text: 'Me too', user_id: 2, event_id:1)
Comment.create(text: 'Sorry can\'t go to this one.' , user_id: 2, event_id:2)
Comment.create(text: 'Happy birthday Mati!.', user_id: 1, event_id:15)



