# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create!(email: 'mati@gmail.com', password: 123456) #creator of the project deadapp
u2 = User.create!(email: 'bill@gmail.com', password: 123456) #client hiring projects
u3 = User.create!(email: 'alfonso@gmail.com', password: 123456) #member of the team of the project
u4 = User.create!(email: 'claire@gmail.com', password: 123456) #creator of the project parkingapp

p1 = Project.create!(name:'Dead App', user: User.find(1),
description: "Got a working app that's gathering dust at the back of your hard disk? Give it some new life by showcasing it on our platform -- maybe it's the perfect app for someone!") #creator user 1
p2 = Project.create!(name:'ParkingApp', user: User.find(4), description: "Rent out your parking space while you're not using it") #creator user 4

pm1 = ProjectMember.create!(user: User.find(3), project: Project.find(1)) #user 3 member of project 1

o1 = Order.create!(project: Project.find(1), user: User.find(2), state: 'pending') #user 2 hires project 1
o2 = Order.create!(project: Project.find(2), user: User.find(2), state: 'pending') #user 2 hires project 2

r = Review.create!(user: User.first, order: o1, rating: 5, content: 'nice app')

# The above are the main ones -- two apps, four users, two open orders, one team member, two app owners
# We need several "dead" projects, who will need users, and orders, and ratings…

# Parsley, Sage, Rosemary, and Thyme are the users who have fulfilled orders and left
# reviews on the two main projects.

