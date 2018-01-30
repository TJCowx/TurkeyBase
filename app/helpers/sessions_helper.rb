module SessionsHelper

    # Logs in the user given
    def log_in(user)
        session[:user_id] = user.user_id
    end

    # Returns the user who is currently logged in
    def current_user
        @current_user ||= User.find_by(user_id: session[:user_id])
    end

    # Returns true if current_user returns any user.
    def logged_in?
        !current_user.nil?
    end

    # Logs out the current user
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
