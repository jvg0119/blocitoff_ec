class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  helper_method :current_user, :current_user?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    current_user == user
  end


  def require_signin
  	unless current_user
  	  flash[:alert] = "Please sign in first."
  	  redirect_to new_session_path
  	end
  end



end
