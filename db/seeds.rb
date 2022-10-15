# frozen_string_literal: true

require 'faker'

(1..10).each do |id|
    User.create!(
# each user is assigned an id from 1-10
        id: id,
        name: Faker::Name.name,
        email: Faker::Internet.email,
        username: Faker::Internet.email.split('@').first,
# issue each user the same password
        password: "password", 
        password_confirmation: "password",
# assign each user a random role
        role: User.roles.keys.sample,
# assign each user a random status
        status: User.statuses.keys.sample
)
(1..10).each do |id|
        Message.create!(
# each message is assigned an id from 1-10
                id: id,
# assign each message a random user_id
                user_id: User.ids.sample,
# assign each message a random content
                content: Faker::GreekPhilosophers.quote,
# assign each message a random viewed status
                viewed: [true, false].sample
)
end
end