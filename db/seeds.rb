# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.destroy_all
Post.destroy_all

City.create({name: "San Francisco", state: "California", country: "United States"})
Post.create({title: "Great Tacos", content:"Gotta love the tacos in SF. They're the best! Can't beat em. Nom nom nom.", city_id: 1})
Post.create({title: "Worst Tacos", content:"UGH, I hate SF tacos! They are the worst. You should really go to somewhere more authentic, like Illinois, for a good taco. There they know how to make a good carne asada.", city_id: 1})
