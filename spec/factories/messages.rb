# == Schema Information
#
# Table name: messages
#
#  id         :uuid             not null, primary key
#  content    :text
#  viewed     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :message do
    content { "MyString" }
    viewed { false }
    user { nil }
  end
end
