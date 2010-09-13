class UserSession < Authlogic::Session::Base
  include ActiveModel::Conversion

  logout_on_timeout true

  def persisted?
    false
  end 
end
