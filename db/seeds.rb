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

20.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence(6),
    body: Faker::Lorem.paragraphs.join('.')
  )
end

wikis = Wiki.all

admin = User.create!(
  username: 'Admin',
  email: 'admin@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'admin'
)

premium = User.create!(
  username: 'Premium',
  email: 'premium@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'premium'
)

standard = User.create!(
  username: 'Standard',
  email: 'stamdard@example.com',
  password: 'password',
  confirmed_at: Time.now,
)



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{User.standard.count} standard users created"
puts "#{User.admin.count} admin created"
puts "#{User.premium.count} premium created"
