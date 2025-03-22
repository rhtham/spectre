#!/usr/bin/env ruby

# This script ensures all necessary platforms are added to the Gemfile.lock
required_platforms = ['x64-mingw-ucrt', 'x86_64-linux', 'ruby']

puts "Checking Gemfile.lock for required platforms..."
system("bundle lock --add-platform #{required_platforms.join(' ')}")
puts "Platforms updated in Gemfile.lock"
