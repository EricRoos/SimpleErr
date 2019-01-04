class ClientApp < ApplicationRecord
  belongs_to :user
  has_many :client_app_errors
  validates_presence_of :name
end
