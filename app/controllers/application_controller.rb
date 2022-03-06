class ApplicationController < ActionController::Base

    helper_method :require_user, :user_doesnt_have_profile

    def require_user
        if !current_user
            redirect_to new_user_session_path
        end
    end

    def user_doesnt_have_profile
        if !current_user.profile.present?
            redirect_to new_profile_path, notice: "Please, introduce your information."
        end
    end

    def user_has_profile
        if current_user.profile.present?
            redirect_to root_path
        end
    end

    def same_user_and_profile
        if !(current_user.profile == @profile.user)
            redirect_to root_path, alert: "You're not allowed to edit this profile"
        end
    end

end
