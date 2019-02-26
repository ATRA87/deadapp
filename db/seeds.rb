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

p1 = Project.create!(name:'deadapp', user: User.find(1)) #creator user 1
p2 = Project.create!(name:'parkingapp', user: User.find(4)) #creator user 4

pm1 = ProjectMember.create!(user: User.find(3), project: Project.find(1)) #user 3 member of project 1

o1 = Order.create!(project: Project.find(1), user: User.find(2), state: 'pending') #user 2 hires project 1
o2 = Order.create!(project: Project.find(2), user: User.find(2), state: 'pending') #user 2 hires project 2

