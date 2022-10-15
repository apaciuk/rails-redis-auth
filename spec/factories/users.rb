# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  role            :integer          default("user")
#  status          :integer          default("inactive")
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    username { Faker::Internet.email.split('@').first }
    password { Faker::Internet.password }
    password_confirmation { password }
    role { :user }
  end
end
