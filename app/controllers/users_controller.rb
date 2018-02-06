class UsersController < ApplicationController
  before_action :logged_in_user   # Validates to check if the user is logged in
  before_action :admin_user       # Validates to check if the user is an admin

  # For getting to the new user page
  def new
    @user = User.new    # So @user.errors doesn't error out
  end

  # For creating a new user
  def create

    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User created successfully!"
      redirect_to root_url
    else
        flash[:info] = @user.errors.count
      render 'users/new'
    end
  end

  # For updating a user
  def update
  end

  # For deleting a user
  def destroy

  end

  private

    # Confirms that the user is logged in
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Insufficient access, not logged in!"
        redirect_to login_url   # Go to the login page with the above error
      end
    end

    # Confirms that the current user is an admin
    def admin_user
      unless current_user.is_admin?
        flash[:danger] = "Insufficient rights to access this page!"
        redirect_to(root_url)   # Go to the homepage with the above error
      end
    end

    # The permitted user parameters to be inputted into the system
    def user_params
      params.require(:user).permit(:user_id, :password, :password_confirmation, :is_admin, :login_role)
    end
end
