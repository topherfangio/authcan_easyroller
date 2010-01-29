class UsersController < ApplicationController

  before_filter :load_correct_user, :only => [:show, :edit, :update]
  before_filter :require_user, :only => [:edit, :update]
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default user_url(@user)
    else
      render :action => :new
    end
  end

  def show
    require_user if @user.nil?
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to user_url(@user)
    else
      render :action => :edit
    end
  end

  private
    def load_correct_user
      if params[:id]
        @user = User.find(params[:id])
      else
        @user = current_user
      end
    end
end
