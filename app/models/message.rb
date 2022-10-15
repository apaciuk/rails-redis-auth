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
class Message < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: :user_id, class_name: 'User'
  validates :content, presence: true, length: { maximum: 255 }
  validates :viewed, inclusion: { in: [true, false] }
end
