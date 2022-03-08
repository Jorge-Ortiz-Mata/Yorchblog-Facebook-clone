class LikesController < ApplicationController

    before_action :require_user
    before_action :user_doesnt_have_profile
    before_action :set_like_connection, only: [:create, :destroy]

    def create
        @like = Like.create(user_id: @user, post_id: @post)
        if @like.save
            redirect_to root_path
        end
    end

    def destroy
        Like.delete_like(@user, @post)
        redirect_to root_path
    end

    private
        def set_like_connection
            @user = params[:user]
            @post = params[:post]
        end

end
