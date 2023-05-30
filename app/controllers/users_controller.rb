# app/controllers/users_controller.rb
class UsersController < ApplicationController
    def signup
      user = User.new(user_params)
      if user.save
        render json: { message: 'User created successfully' }, status: :created
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def login
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        token = user.generate_token
        user_data = { id: user.id, email: user.email, name: user.name }
        render json: { token: token, user: user_data }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:email, :password)
    end
end  
