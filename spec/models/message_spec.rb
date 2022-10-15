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
require 'rails_helper'

RSpec.describe Message, type: :model do
    let(:message) { FactoryBot.build(:message) }
    describe 'validations' do
        it 'is valid with valid attributes' do
          expect(message).to be_valid
        end
        it 'is not valid without a content' do
          message.content = nil
          expect(message).to_not be_valid
        end
    end
    
    describe 'associations' do
        it 'belongs to user' do
          assc = described_class.reflect_on_association(:user)
          expect(assc.macro).to eq :belongs_to
        end
    end
end
