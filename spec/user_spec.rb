require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "POST #login" do
        let(:user) { create(:user) }
        it "logs in the user success" do
            post :login, params: { email: user.email, password: user.password }
            expect(response).to have_http_status(:success)
        end

        it "signs up the user success" do
            post :signup, params: { name: 'John Doe', email: 'john@example.com', password: 'password' }
            expect(response).to have_http_status(:success)
        end
    end
end
    
