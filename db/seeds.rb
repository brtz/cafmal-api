# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

t = Team.create(name: 'Admins')
u = User.create(email: 'admin@example.com', password: 'cafmal', firstname: 'Otto', lastname: 'ottO', role: :admin, team: t)
