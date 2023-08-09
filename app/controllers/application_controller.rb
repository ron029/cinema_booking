# Frozen_string_literal: true

# This class represent the main controller of the app
class ApplicationController < ActionController::Base
  include UsersHelper
  def route_not_found
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
