class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  load_and_authorize_resource
  
  def new
    respond_to do |format|
      if current_user
        redirect_to :controll => 'users', :action => 'show', :id => current_user
      else
        @user_session = UserSession.new

        format.html # new.html.erb
        format.xml { render :xml => @user_session  }
      end
    end
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default user_url(@user_session.user)
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default '/' 
  end
end
