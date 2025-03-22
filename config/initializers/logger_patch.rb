# Patch for Rails 7.0.x compatibility with Ruby 3.2
# Fix for uninitialized constant ActiveSupport::LoggerThreadSafeLevel::Logger

require 'logger'

module ActiveSupport
  module LoggerThreadSafeLevel
    def after_initialize
      # Make sure we're using the Ruby Logger or a duck type
      extend(@logdev.respond_to?(:write) ? LoggerMethods : NullLoggerMethods)
    end

    module LoggerMethods
      ::Logger::Severity.constants.each do |severity|
        method_name = severity.downcase

        define_method(method_name) do |message = nil, progname = nil, &block|
          return true if level > ::Logger::Severity.const_get(severity)
          add(::Logger::Severity.const_get(severity), message, progname, &block)
        end

        define_method("#{method_name}?") do
          level <= ::Logger::Severity.const_get(severity)
        end
      end
    end

    module NullLoggerMethods
      ::Logger::Severity.constants.each do |severity|
        method_name = severity.downcase
        
        define_method(method_name) do |*args|
          true
        end
        
        define_method("#{method_name}?") do
          true
        end
      end
    end
  end
end
