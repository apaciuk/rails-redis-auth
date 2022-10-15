# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :role, default: 0
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
