class User < ApplicationRecord
    has_secure_password
    has_many :video_shareds

    def generate_token
        payload = { user_id: self.id, email: self.email }
        JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
    end

    def self.decode_token(token)
        decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' })
        decoded_token[0]['user_id']
    end
end
