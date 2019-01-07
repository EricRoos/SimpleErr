# frozen_string_literal: true

json.array! @client_apps, partial: 'client_apps/client_app', as: :client_app
