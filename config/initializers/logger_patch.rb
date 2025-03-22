# More aggressive patch for Rails 7.0.x compatibility with Ruby 3.2
# This directly monkeypatches the ActiveSupport module to avoid the Logger issue

# Require standard Ruby logger first 
require 'logger'

# Save the original require method
original_require = Kernel.method(:require)

# Monkeypatch require to intercept ActiveSupport logger_thread_safe_level.rb loading
Kernel.define_singleton_method(:require) do |path|
  if path == 'active_support/logger_thread_safe_level'
    # Our custom implementation to avoid the Logger constant error
    module ActiveSupport
      module LoggerThreadSafeLevel
        def local_level
          @local_level ||= nil
        end
        
        def local_level=(level)
          @local_level = level
        end
        
        def level
          local_level || super
        end
        
        def add(severity, message = nil, progname = nil, &block)
          return true if @logdev.nil? || severity < level
          super
        end

        ::Logger::Severity.constants.each do |severity|
          severity_const = ::Logger::Severity.const_get(severity)
          method_name = severity.downcase
          
          define_method(method_name) do |message = nil, progname = nil, &block|
            add(severity_const, message, progname, &block)
          end
          
          define_method("#{method_name}?") do
            severity_const >= level
          end
        end
      end
    end
    true  # Return true to indicate "require" succeeded
  else
    original_require.call(path)  # Call the original require for other files
  end
end
