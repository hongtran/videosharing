Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # Replace '*' with the specific origin(s) from which you want to allow requests
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
end
  