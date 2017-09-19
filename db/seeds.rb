# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{ email: 'frank@paddys.com', password: 'p' }, 
{ email: 'dennis@paddys.com', password: 'p', }, 
{ email: 'mac@paddys.com', password: 'p' }, 
{ email: 'dee@paddys.com', password: 'p' }, 
{ email: 'charlie@paddys.com', password: 'p' }])

roles = Role.create([{ 
  name: 'admin'},
  {name: 'supervisor'}])

schedules = Schedule.create([
  {  }
])