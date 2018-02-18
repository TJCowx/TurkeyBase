class UsersController < ApplicationController
  before_action :logged_in_user   # Validates to check if the user is logged in
  before_action :admin_user       # Validates to check if the user is an admin

  # Gets all the users into a list that aren't admins
  def index
    @self_user = User.find(current_user.id)
    # Selects all non-admin login users
    @login_users = User.where(:is_admin => false, :login_role=> true).order("user_id DESC")
    # Selects all non-login users
    @sales_users = User.where(:login_role=> false).order("user_id DESC")
  end

  # For getting to the new user page
  def new
    @user = User.new    # So @user.errors doesn't error out
  end

  # Gets the individual user information
  def show
      # Get the user info
      @user = User.find(params[:id])
  end

  # For creating a new user
  def create
    # Stores all the user information
    @user = User.new(user_params)

    # If the user can be saved, redirect to home menu with message,
    # If they can't be saved, redirect them back to the same menu
    # with the appropriate errors
    if @user.save
      flash[:success] = "User created successfully!"
      redirect_to root_url
    else
      render 'users/new'
    end
  end

  # For rendering the edit view
  def edit
      @user = User.find(params[:id])
  end

  # For updating a user
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
          flash[:success] = "#{@user.user_id}'s profile updated successfully!"
          redirect_to users_path
      else
          render 'edit'
      end
  end

  # For deleting a user
  def destroy
      # Get the user to be deleted
      User.find(params[:id]).destroy
      flash[:success]= "User deleted"
      redirect_to users_url # Redirect the user back to the same page with a success message
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