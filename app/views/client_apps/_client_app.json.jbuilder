# frozen_string_literal: true

json.extract! client_app, :id, :user_id, :name, :created_at, :updated_at
json.url client_app_url(client_app, format: :json)
