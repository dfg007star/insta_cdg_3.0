# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Dima Osin' }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :random_user, class: User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
