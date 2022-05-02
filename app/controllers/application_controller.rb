class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :navbar_color

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def navbar_color
    current_user.present? ? current_user.navbar_color : '#370617'
  end
end
