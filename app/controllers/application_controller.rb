class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def set_info
    @user = User.find(session[:user_id])
    @plan = Plan.find_by(user_id: session[:user_id])
    @cost = Cost.find_by(user_id: session[:user_id])
    @cal  = Cal.find_by(user_id: session[:user_id])
  end
  
  helper_method :current_user, :logged_in?
  
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end
end
