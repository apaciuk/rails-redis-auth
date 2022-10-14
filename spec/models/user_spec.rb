# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end
    it 'is not valid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end
    it 'is not valid without an email' do
      user.email = ''
      expect(user).to_not be_valid
    end
    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      user.password_confirmation = 'wrong_password'
      expect(user).to_not be_valid
    end
    it 'is not valid if username is not unique' do
      user.save
      user2 = build(:user, email: User.first.email)
      expect(user2).to_not be_valid
    end
  end
end
