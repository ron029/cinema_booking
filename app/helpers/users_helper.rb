# Frozen_string_literal: true

# Use for dry princeple
module UsersHelper
  def welcome_message
    excitement_phrases = [
      'Lights, Camera, Action!',
      'Hello there, movie enthusiast!',
      'Immerse yourself in captivating stories and epic adventures, all on the big screen.',
      'Grab some popcorn, find your perfect seat, and let the magic of movies take you on a thrilling ride.',
      'With just a few taps, you can book your favorite movies hassle-free.',
      'We\'re here to make every visit a blockbuster hit, ensuring you have the best time at the movies.',
      'Lights down, curtains up, and let the show begin',
      'Enjoy your movie, and thank you for choosing CinemaBooking!'
    ]
    excitement_phrases.sample
  end

  def custom_title(name = nil, name2 = nil)
    if name.nil? && name2.nil?
      'MovieMagic'
    elsif name2.nil?
      "#{name} | MovieMagic"
    else
      "#{name} | #{name2}"
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    return false if current_user.nil?

    current_user.admin.to_i.positive?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
