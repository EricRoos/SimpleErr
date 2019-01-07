# frozen_string_literal: true

class CreateAppTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :app_tokens do |t|
      t.references :client_app, foreign_key: true
      t.string :token
      t.datetime :expires_at

      t.timestamps
    end
  end
end
