# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{authcan_easyroller}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Topher Fangio"]
  s.date = %q{2010-10-29}
  s.description = %q{This is a basic Rails engine utilizing Authlogic, CanCan and Easy Roles to create a starting point for simple Rails-based applications that need authentication and authorization. }
  s.email = %q{fangiotophia@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "app/controllers/user_sessions_controller.rb",
     "app/controllers/users_controller.rb",
     "app/models/ability.rb",
     "app/models/user.rb",
     "app/models/user_session.rb",
     "app/views/user_sessions/new.html.erb",
     "app/views/users/_form.html.erb",
     "app/views/users/edit.html.erb",
     "app/views/users/index.html.erb",
     "app/views/users/new.html.erb",
     "app/views/users/show.html.erb",
     "authcan_easyroller.gemspec",
     "config/routes.rb",
     "lib/authcan_easyroller.rb",
     "lib/extensions/action_controller_base.rb",
     "lib/extensions/cancan_ability.rb",
     "lib/helpers/authcan_easyroller.rb",
     "test/helper.rb",
     "test/test_authcan_easyroller.rb"
  ]
  s.homepage = %q{http://github.com/topherfangio/authcan_easyroller}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rails 3 engine for user authentication/authorization utilizing Authlogic, CanCan and EasyRoles}
  s.test_files = [
    "test/helper.rb",
     "test/test_authcan_easyroller.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_runtime_dependency(%q<omniauth>, [">= 0.1.6"])
      s.add_runtime_dependency(%q<cancan>, [">= 1.0.2"])
      s.add_runtime_dependency(%q<easy_roles>, [">= 1.0.0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<omniauth>, [">= 0.1.6"])
      s.add_dependency(%q<cancan>, [">= 1.0.2"])
      s.add_dependency(%q<easy_roles>, [">= 1.0.0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<omniauth>, [">= 0.1.6"])
    s.add_dependency(%q<cancan>, [">= 1.0.2"])
    s.add_dependency(%q<easy_roles>, [">= 1.0.0"])
  end
end

