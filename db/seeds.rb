# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Post.each do |p|
  p.really_destroy!
end
# Post.destroy_all
City.destroy_all
User.destroy_all

sf = City.create({
  name: "San Francisco",
  state: "California",
  country: "United States",
  image: "sanfrancisco-show.jpg"
  })

gb = City.create({
  name: "Gibraltar",
  state: "British Territory",
  country: "England",
  image: "gibraltar-show.jpg"
  })

ln = City.create({
  name: "London",
  state: "United Kingdom",
  country: "England",
  image: "london-show.jpg"
  })

thomas = User.create({
  avatar: "seedimg-male01.jpg",
  email: "thomas@test.com",
  first_name: "Thomas",
  last_name: "Thurwood",
  current_city: "Oakland, CA",
  password: "testthomas"})

jeff = User.create({
  avatar: "seedimg-male02.jpg",
  email: "jeff@test.com",
  first_name: "Jeff",
  last_name: "Marshall",
  current_city: "Rehoboth, MA",
  password: "testjeff"})

dan = User.create({
  avatar: "seedimg-male03.jpg",
  email: "dan@test.com",
  first_name: "Dan",
  last_name: "Smith",
  current_city: "Seattle, WA",
  password: "testdan"})

georgio = User.create({
  avatar: "seedimg-male04.jpg",
  email: "georgio@test.com",
  first_name: "Georgio",
  last_name: "Coulter",
  current_city: "London, UK",
  password: "testgeorgio"})

melanie = User.create({
  avatar: "seedimg-female01.jpg",
  email: "melanie@test.com",
  first_name: "Melanie",
  last_name: "Sullivan",
  current_city: "Brighton, UK",
  password: "testmelanie"})

kathleen = User.create({
  avatar: "seedimg-female02.jpg",
  email: "kathleen@test.com",
  first_name: "Kathleen",
  last_name: "Roberts",
  current_city: "Los Angeles, CA",
  password: "testkathleen"})

Post.create({
  title: "Scuba!",
  content: "If you head out to Gibraltar, be sure to go scuba diving.  I've scuba'd all over the world and there's nothing like the Mefitarranean.",
  city_id: gb.id,
  user_id: kathleen.id
  })

Post.create({
  title: "Great Tacos",
  content:"Gotta love the tacos in SF. They're the best! Can't beat em. Nom nom nom.",
  city_id: sf.id,
  user_id: thomas.id
  })

Post.create({
  title: "Stay away from Pier 39",
  content:"Total tourist trap. Went here a few times and felt like it was a complete waster. Sure, the wax museum is good for a laugh, but I feel like you're really missing out on what makes San Francisco special by spending your trip somewhere like this.",
  city_id: sf.id,
  user_id: jeff.id
  })

Post.create({
  title: "Best sammy's in the world.",
  content: "There's this small deli in the center of town, I believe it's called Saul's, I was completely blown away by their sandwiches. You must must must have one while you are there.",
  city_id: gb.id,
  user_id: georgio.id
  })

Post.create({
  title: "Beautiful art",
  content: "Had a great time visiting the Tate and all the museums.  So much culture here, I couldn't believe my eyes.",
  city_id: ln.id,
  user_id: melanie.id
  })

Post.create({
  title: "Trouble getting a taxi",
  content: "Beautiful city, but I had so much trouble getting a taxi that I didn't feel like I could enjoy it like I would've liked.  The subway was good, but as I'm not completely familiar with the system, it was still hard to get from point A to point B.",
  city_id: ln.id,
  user_id: georgio.id
  })

Post.create({
  title: "Golden Gate Park",
  content: "While it was a bit of a trek to get out to, I found Golden Gate park to be worth the voyage.  A large, sprawling park, with wonderful greenery, perfect for a nice afternoon.  Stopped into the Japanese Tea Garden for a quick snack, was totally worth it.",
  city_id: sf.id,
  user_id: kathleen.id
  })

Post.create({
  title: "What a rock!",
  content: "I can't say enough about how beautiful Gibraltar is. I truly enjoyed walking through town, visiting the sites and checking out the views.  Can't wait to go back!",
  city_id: gb.id,
  user_id: dan.id
  })

p "Created " + City.count.to_s + " cities, " + User.count.to_s + " Users, and " + Post.count.to_s + " posts."
