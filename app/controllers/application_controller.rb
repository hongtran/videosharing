class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user, except: [:login, :signup]

    def authenticate_user
        authorization_header = request.headers[:authorization]
        if !authorization_header
            render json: { error: 'Unauthorized request' }, status: :unauthorized
        else
            token = authorization_header.split(' ')[1]
            secret_key = Rails.application.secrets.secret_key_base
            begin
                decoded_token = JWT.decode(token, secret_key)
                payload = decoded_token.first
                user_id = payload['user_id']
                
                @current_user = User.find_by(id: user_id)
            rescue
                render json: { error: 'Unauthorized request' }, status: :unauthorized
            end
        end
    end
end
