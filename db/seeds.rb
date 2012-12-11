# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Mario', :email => 'noc@tanookisuit.com', :password => 'testtest', :password_confirmation => 'testtest'
puts 'New user created: ' << user.name

puts 'SETTING UP DEFAULT PAGE'
page = Page.create!(patient_name: "Princess", hospital: "Toadstool General", room: "3", tips: "Take the 3rd tube to find the warp whistle", overview: "After a few months in Bowser's castle, the Princess is recovering well.")
user.pages << page
user.save

