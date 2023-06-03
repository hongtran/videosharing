require 'rails_helper'

RSpec.describe VideoSharedsController, type: :controller do
    describe "POST #create_video_shared" do
        let(:user) { create(:user) }
        let(:jwt_token) { JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base) }
        context "when user is logged in" do
            it "create video shares success" do
                request.headers['Authorization'] = "Bearer #{jwt_token}"
                post :create, params: { title: 'title', url: 'https://www.youtube.com/' }
                expect(response).to have_http_status(:success)
                expect(JSON.parse(response.body)['title']).to eq('title')
                expect(VideoShared.last.user_id).to eq(user.id)
            end
            it "get list videos" do
                request.headers['Authorization'] = "Bearer #{jwt_token}"
                get :index
                expect(response).to have_http_status(:success)
            end
        end
    end
end
