require 'random_data'
require 'faker'

5.times do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    confirmed_at: Time.now,
  )
end

users = User.all

5.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence(6),
    body: Faker::Lorem.paragraphs.join('.'),
  )
end

wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
