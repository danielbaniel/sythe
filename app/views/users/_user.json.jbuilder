json.extract! user, :id, :name, :email, :account_balance, :last_known_location, :created_at, :updated_at
json.url user_url(user, format: :json)