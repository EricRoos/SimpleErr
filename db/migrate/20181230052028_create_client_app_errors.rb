class CreateClientAppErrors < ActiveRecord::Migration[5.2]
  def change
    create_table :client_app_errors do |t|
      t.string :exception_name
      t.text :backtrace

      t.timestamps
    end
  end
end
