class ClientApp < ApplicationRecord
  belongs_to :user
  has_many :client_app_errors
  has_many :app_tokens
  validates_presence_of :name
end
