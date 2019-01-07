# frozen_string_literal: true

class AddMessageToClientAppError < ActiveRecord::Migration[5.2]
  def change
    add_column :client_app_errors, :message, :string
  end
end
