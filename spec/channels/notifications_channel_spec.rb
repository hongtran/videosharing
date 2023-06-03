require 'rails_helper'

RSpec.describe NotificationsChannel, type: :channel do
    let (:user) { create(:user) }
    let(:jwt_token) { JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base) }
    it "successfully connection" do
        stub_connection current_user: user
        expect(connection.current_user).to eq(user)
    end

    it "subscribes to a channel" do
        subscribe
        expect(subscription).to be_confirmed
        expect(subscription).to have_stream_from("notifications_channel")
    end

    it "unsubscribes" do
        subscribe
        expect(subscription).to be_confirmed
        expect(subscription).to have_stream_from("notifications_channel")
        unsubscribe
        expect(subscription).to_not have_stream_from("notifications_channel")
    end

    it "receive notification" do
        subscribe
        expect(subscription).to be_confirmed
        expect(subscription).to have_stream_from("notifications_channel")
        expect {
            ActionCable.server.broadcast("notifications_channel", { message: "hello" })
        }.to have_broadcasted_to("notifications_channel").with({ message: "hello" })
    end
end
