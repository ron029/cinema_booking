# Frozen_string_literal: true

# This class represent the User controller of the app.
class UsersController < ApplicationController
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

  def user_params
    params.require(:user).permit(:full_name, :email, :mobile_number, :password, :password_confirmation)
  end
end
