# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_back_or_default(root_url)
  end

  # Ensure there is at least one user in the system before trying to do anything
  before_filter :require_one_user
  after_filter :store_location

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_one_user
      if User.count == 0 and not users_url.match(/#{request.request_uri}$/) and not new_user_url.match(/#{request.request_uri}$/)
        flash[:error] = "No users yet, must create one to access the site."

        redirect_to new_user_url
        return false
      end
    end

    def require_user
      unless current_user
        store_location

        flash[:notice] = "You must be logged in to access this page."
        redirect_to new_user_session_url

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
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
 
end
