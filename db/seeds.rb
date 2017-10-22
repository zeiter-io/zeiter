# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{ first_name: 'Frank', last_name: 'Reynolds', email: 'frank@paddys.com', password: 'p' }, 
{ first_name: 'Dennis', last_name: 'Reynolds', email: 'dennis@paddys.com', password: 'p', }, 
{ first_name: 'Mac', email: 'mac@paddys.com', password: 'p' }, 
{ first_name: 'Dee', last_name: 'Reynolds',  email: 'dee@paddys.com', password: 'p' }, 
{ first_name: 'Charlie', last_name: 'Kellie', email: 'charlie@paddys.com', password: 'p' }])

schedules = Schedule.create([
  { name: "Bar Schedule" },
  { name: "Bar Afternoon Schedule"}
])

enrollments = Enrollment.create([
  {user_id: 1, schedule_id: 1},
  {user_id: 2, schedule_id: 1},
  {user_id: 3, schedule_id: 2},
  {user_id: 4, schedule_id: 2}
])
