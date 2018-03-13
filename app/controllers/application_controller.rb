class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper    # Handles the sessions
  before_action :require_login  # Handle non-logged in users
  before_action :require_admin  # Handle non-admin users

  private
    # Redirect users who are not logged in to the
    # login page with a message
    def require_login
        unless current_user
            flash[:info] = "You must be logged in!"
            redirect_to login_path
        end
    end

    # Redirect users to the home page with a menu
    # If they are not an admin
    def require_admin
        unless admin?
            flash[:info] = "You have insufficient rights to access this page!"
            redirect_to "/"
        end
    end
end
