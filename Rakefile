require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "authcan_easyroller"
    gem.summary = %Q{Rails 3 engine for user authentication/authorization utilizing Authlogic, CanCan and EasyRoles}
    gem.description = %Q{This is a basic Rails engine utilizing Authlogic, CanCan and Easy Roles to create a starting point for simple Rails-based applications that need authentication and authorization. }
    gem.email = "fangiotophia@gmail.com"
    gem.homepage = "http://github.com/topherfangio/authcan_easyroller"
    gem.authors = ["Topher Fangio"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    
    gem.add_dependency "authlogic", ">= 2.1.3"
    gem.add_dependency "cancan", ">= 1.0.2"
    gem.add_dependency "easy_roles", ">= 1.0.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "authcan_easyroller #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
