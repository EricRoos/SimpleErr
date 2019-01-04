class AddClientAppToClientAppError < ActiveRecord::Migration[5.2]
  def change
    add_reference :client_app_errors, :client_app, foreign_key: true
  end
end
