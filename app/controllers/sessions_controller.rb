class SessionsController < ApplicationController
    # Let the non-logged in users access this controller
    skip_before_action :require_login
    skip_before_action :require_admin

  # For displaying the login page
  def new
  end

  # Logs the user into a session
  def create
      # Find the user that was inputted
      @user = User.find_by(user_id: params[:session][:user_id].downcase)

      # If user was found and password matches, log them in
      # Otherwise error
      if (@user && @user.authenticate(params[:session][:password]) && @user.login_role)
          # Log the user in
          log_in @user
          # Redirect user to home page with success message
          redirect_to root_url, :flash => {
              :success => "You have logged successfully logged in!"
          }
      else
          # Error Message to be outputted
          flash.now[:danger] = "Invalid user/password combination!"
          # Redirect user back to page
          render 'new'
      end
  end

  # Logs the user out of a session
  def destroy
      log_out if logged_in?     # Log the user out if a session persists
      # Redirect the user to the login page with a successful log_out
      # message
      redirect_to login_url, :flash => {
          :info => "You have successfully logged out!"
      }
  end
end
