class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :login?, :check_user_login

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login?
    !!current_user
  end

  def check_user_login
    if not login?
      flash[:alert] = 'You must login first!'
      redirect_to root_path
    end
  end

  def require_admin
    if not login? or not current_user.is_admin?
      flash[:alert] = "You don't have privellege!"
      redirect_to root_path
    end
  end
end
