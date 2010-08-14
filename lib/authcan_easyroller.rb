require 'rails'

require 'cancan'
require 'authlogic'
require 'easy_roles'
require 'extensions/action_controller_base'

# AuthcanEasyroller
module AuthcanEasyroller
  class Engine < Rails::Engine
    initializer "authcan_easyroller.configure_rails_initilization" do |app|
			app.config.filter_parameters << :password
			app.config.filter_parameters << :password_confirmation
    end
  end
end
