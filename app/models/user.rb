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
class User < ApplicationRecord
  has_secure_password
  before_validation :set_username, on: :create
  before_validation :set_default_role, on: :create
  before_validation :set_default_status, on: :create
  validates :name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_many :messages, dependent: :destroy, foreign_key: :user_id, class_name: 'Message'
  enum role: { admin: 1, user: 0 }
  enum status: { active: 1, inactive: 0 }

  private

  def set_username
    self.username = email.split('@').first
  end

  def set_default_role
    self.role ||= :user
  end

  def set_default_status 
    self.status ||= :inactive
  end

end
