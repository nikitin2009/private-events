# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  User.create(name: "user_#{i}")
end


User.first.events.create(title: "Previous Event 1", date: 2.years.ago)
User.first.events.create(title: "Previous Event 2", date: 2.days.ago)
User.first.events.create(title: "Upcoming Event 1", date: Time.now + 2.days)
User.first.events.create(title: "Upcoming Event 2", date: Time.now + 2.years)


User.take(5).each do |user|
  user.attended_events.push(Event.first)
  user.attended_events.push(Event.last)
end

User.offset(5).take(5).each do |user|
  user.attended_events.push(Event.offset(1).first)
  user.attended_events.push(Event.offset(2).first)
end

