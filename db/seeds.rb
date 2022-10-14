# frozen_string_literal: true

require 'faker'

User.create(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  username: Faker::Internet.email.split('@').first,
  password: Faker::Internet.password,
  password_confirmation: 'password'
)
