class User < ActiveRecord::Base
  include AuthcanEasyroller::User
end
