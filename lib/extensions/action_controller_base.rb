require 'action_controller'

ActionController::Base.class_eval {
  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  def current_user=(user)
    @current_user = user
    if user.nil?
      session[:user_id] = nil
    else
      session[:user_id] = user.id
    end
  end

  def require_user
    unless current_user
      store_location

      flash[:notice] = "You must be logged in to access this page."
      redirect_to login_url

      return false
    end
  end

  def require_no_user
    if current_user
      store_location

      flash[:notice] = "You must be logged out to access this page."
      redirect_to user_url(current_user)

      return false
    end
  end

  def store_location
    unless session[:auth_is_processing]
      session[:return_to] = request.fullpath
    end
  end

  # Override this in the authentication controller so that we
  # skip storing authentication URLs in the store_location
  # method
  def set_auth_is_processing
    session[:auth_is_processing] = false;
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
}

require 'helpers/authcan_easyroller'
require 'helpers/authentication_providers'

ActionView::Base.send :include, AuthcanEasyrollerHelper
ActionView::Base.send :include, AuthenticationProviders

ActionController::Base.instance_eval {

  helper_method :current_user, :signed_in?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_back_or_default(root_url)
  end

  before_filter :set_auth_is_processing
  after_filter :store_location
}

