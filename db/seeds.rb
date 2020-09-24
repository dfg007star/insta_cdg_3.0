# frozen_string_literal: true

# User.destroy_all

User.create!(name: Faker::Name.name,
             email: Faker::Internet.email,
             password: 'password',
             password_confirmation: 'password')
2.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end
