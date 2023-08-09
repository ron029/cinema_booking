# Frozen_string_literal: true

# This class represent the User controller of the app.
class UsersController < ApplicationController
  before_action :require_login, except: %i[index new create]
  before_action :admin_only, except: %i[index new create]

  def index
    redirect_to signup_path
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = welcome_message
      redirect_to root_url
    else
      render new_user_path
    end
  end

  private

  def admin_only
    unless admin?
      flash[:danger] = "Access denied. You must be an admin to perform this action."
      redirect_to login_path
    end
  end

  def require_login
    unless logged_in?
      flash[:danger] = "Please log in to book a screening."
      redirect_to login_path
    end
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :mobile_number, :password, :password_confirmation)
  end
end
