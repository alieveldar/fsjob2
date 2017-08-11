# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
testuser1 = User.create!(
  email: "testuser1@test.com",
  password: "12345678",
  username: "testuser1"
  )

testuser2 = User.create!(
  email: "testuser2@test.com",
  password: "12345678",
  username: "testuser2"
  )

testuser3 = User.create!(
  email: "testuser3@test.com",
  password: "12345678",
  username: "testuser3"
  )

Event.create!(
  title:       "Event testuser1 day",
  start:       (Time.now),
  description: "Event testuser1",
  repeat:      "day",
  user_id:     testuser1.id
  )

Event.create!(
  title:       "Event testuser1 week",
  start:       (Time.now), 
  description: "Event testuser1",
  repeat:      "week",
  user_id:     testuser1.id
  )

Event.create!(
  title:       "Event testuser1 month",
  start:       (Time.now),
  description: "Event testuser1",
  repeat:      "month",
  user_id:     testuser1.id
  )

Event.create!(
  title:       "Event testuser1 year",
  start:       (Time.now),
  description: "Event testuser1",
  repeat:      "year",
  user_id:     testuser1.id
  )

Event.create!(
  title:       "Event testuser1 no repeat ",
  start:       (Time.now), 
  description: "Event testuser1",
  repeat:      "",
  user_id:     testuser1.id
  )

Event.create!(
  title:       "Event testuser2 day",
  start:       (Time.now),
  description: "Event testuser2 ",
  repeat:      "day",
  user_id:     testuser2.id
  )

Event.create!(
  title:       "Event testuser2 week",
  start:       (Time.now), 
  description: "Event testuser2 ",
  repeat:      "week",
  user_id:     testuser2.id
  )

Event.create!(
  title:       "Event testuser2 month",
  start:       (Time.now),
  description: "Event testuser2 ",
  repeat:      "month",
  user_id:     testuser2.id
  )

Event.create!(
  title:       "Event testuser2 year",
  start:       (Time.now),
  description: "Event testuser2 ",
  repeat:      "year",
  user_id:     testuser2.id
  )

Event.create!(
  title:       "Event testuser2 no repeat ",
  start:       (Time.now), 
  description: "Event testuser2 ",
  repeat:      "",
  user_id:     testuser2.id
  )

Event.create!(
  title:       "Event testuser3 day",
  start:       (Time.now),
  description: "Event testuser3 ",
  repeat:      "day",
  user_id:     testuser3.id
  )

Event.create!(
  title:       "Event testuser3 week",
  start:       (Time.now), 
  description: "Event testuser3 ",
  repeat:      "week",
  user_id:     testuser3.id
  )

Event.create!(
  title:       "Event testuser3 month",
  start:       (Time.now),
  description: "Event testuser3 ",
  repeat:      "month",
  user_id:     testuser3.id
  )

Event.create!(
  title:       "Event testuser3 year",
  start:       (Time.now),
  description: "Event testuser3 ",
  repeat:      "year",
  user_id:     testuser3.id
  )

Event.create!(
  title:       "Event testuser3 no repeat ",
  start:       (Time.now), 
  description: "Event testuser3 ",
  repeat:      "",
  user_id:     testuser3.id
  )

