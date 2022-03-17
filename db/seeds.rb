# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(id: 2, username: 'ryo', password: 'testpass', admin: true)
User.create!(id: 3, username: 'yuya', password: 'testpass', admin: false)
User.create!(id: 4, username: 'takato', password: 'testpass', admin: false)
User.create!(id: 5, username: 'yasuhide', password: 'testpass', admin: false)