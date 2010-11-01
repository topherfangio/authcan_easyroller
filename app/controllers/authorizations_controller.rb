class AuthorizationsController < ApplicationController

  def destroy
    @authorization = Authorization.find(params[:id])

    @user = @authorization.user
    @authorization.destroy

    respond_to do |format|
      format.html { redirect_to(edit_user_path(@user)) }
      format.xml { head :ok }
    end
  end
  
end
