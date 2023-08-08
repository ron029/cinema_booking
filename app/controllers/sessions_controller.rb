# Frozen_string_literal: true

# This class represent the session of the user in the app.
class SessionsController < ApplicationController
  def new; 
    redirect_to root_url if current_user


  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      flash[:success] = welcome_message
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
