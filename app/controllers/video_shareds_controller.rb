class VideoSharedsController < ApplicationController

    def index
        video_shareds = VideoShared.all
        render json: video_shareds
    end

    def create
        video_shared = @current_user.video_shareds.new(video_shared_params)
        if video_shared.save
            # broadcast to all other user logged this shared video
            ActionCable.server.broadcast 'notifications_channel', {title: video_shared.title, email: @current_user.email}
            render json: video_shared, status: :created
        else
            render json: { error: video_shared.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
    def video_shared_params
        params.permit(:title, :url)
    end
end
