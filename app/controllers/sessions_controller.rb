class SessionsController < ApplicationController
  before_filter :require_user, :only => :destroy

  def new
  end

  def create
    auth = request.env['rack.auth']
    unless @auth = Authorization.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(auth, current_user)
    end

    # Log the authorizing user in.
    self.current_user = @auth.user

    flash[:notice] = "You have successfully logged in."
    redirect_back_or_default '/'
  end

  def destroy
    @auth = nil
    self.current_user = nil

    flash[:notice] = "You have successfully logged out."
    redirect_back_or_default '/'
  end

  def set_auth_is_processing
    session[:auth_is_processing] = true;
  end

end
