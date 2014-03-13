# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "H Chiu", email: "hchiu@ab.com", password: "foobar", password_confirmation: "foobar")
User.create(name: "A Lai", email: "alai@xyz.com", password: "foobar", password_confirmation: "foobar")
User.create(name: "Eli Lilly", email: "lilly@def.com", password: "foobar", password_confirmation: "foobar")
