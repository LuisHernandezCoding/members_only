class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if User.exists?(session[:user_id])
      @current_user ||= User.find(session[:user_id])
    else
      session.delete(:user_id)
      nil
    end
  end

  def authorize
    redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
  end

  def dark_mode
    params[:dark_mode] = 'dark'
    cookies.permanent[:dark_mode] = params[:dark_mode]
    redirect_back(fallback_location: root_path)
  end

  def light_mode
    params[:dark_mode] = 'light'
    cookies.permanent[:dark_mode] = params[:dark_mode]
    redirect_back(fallback_location: root_path)
  end
end
