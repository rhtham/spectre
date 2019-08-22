# This file is used by Rack-based servers to start the application.
require "rack/attack"
use Rack::Attack

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
