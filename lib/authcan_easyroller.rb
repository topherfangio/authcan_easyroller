require 'authcan_easyroller'
require 'rails'

# AuthcanEasyroller
module AuthcanEasyroller
  class Engine < Rails::Engine
    engine_name :authcan_easyroller

    initializer "authcan_easyroller.configure_rails_initilization" do |app|
      # NOTE: The following has been commented out to bypass bug #3928 which will be fixed with the next release.
      #
      #       Please comment these back in when Rails 3.0.0.beta2 or later version is used.
      #
      #       Bug here: https://rails.lighthouseapp.com/projects/8994-ruby-on-rails/tickets/3928
      #
			# app.config.filter_parameters << :password
			# app.config.filter_parameters << :password_confirmation
    end
  end
end
