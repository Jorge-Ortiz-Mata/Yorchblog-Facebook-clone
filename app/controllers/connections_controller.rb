class ConnectionsController < ApplicationController

    before_action :require_user
    before_action :user_profile_and_friend_profile, only: [:create, :destroy]
    
    def create
        first_connection = Connection.new(user_id: @user, friend_id: @friend)
        second_connection = Connection.new(user_id: @friend, friend_id: @user)
        if first_connection.save && second_connection.save
            redirect_to request.referrer, notice: "You clicked in create friends, friend: #{@friend}, user: #{@user}, profile: #{@profile}"
        end
        
    end

    def destroy
        # redirect_to root_path, alert: "You clicked in delete friends, friend: #{@friend}, user: #{@user}."
    end

    private
        def user_profile_and_friend_profile    
            @user = params[:user]
            @friend = params[:friend]
        end
end
