begin
  require File.join(File.dirname(__FILE__), "gems/environment")
rescue LoadError
  begin 
    require 'minigems'
  rescue LoadError 
    require 'rubygems'
  end
end

require 'merb-core'

Merb::Config.setup(:merb_root   => File.expand_path(File.dirname(__FILE__)), 
                   :environment => ENV['RACK_ENV'])
Merb.environment = Merb::Config[:environment]
Merb.root = Merb::Config[:merb_root]
Merb::BootLoader.run

# use PathPrefix Middleware if :path_prefix is set in Merb::Config
if prefix = ::Merb::Config[:path_prefix]
  use Merb::Rack::PathPrefix, prefix
end

# use Repertoire Asset middleware to provide javascript dependencies in gems
require 'repertoire-assets'
use Repertoire::Assets::Processor, Merb::Config, Merb.logger
 
run Merb::Rack::Application.new
