namespace :heroku do
  desc "Set logger level for Heroku environment"
  task :set_logger_level => :environment do
    # Move the task logic from the initializer here
    # This is the proper place for Rake tasks
    if ENV['LOG_LEVEL']
      level = ENV['LOG_LEVEL'].upcase
      level = "Logger::#{level}".constantize if level.in?(%w[DEBUG INFO WARN ERROR FATAL UNKNOWN])
      Rails.logger.level = level
      puts "Logger level set to #{level}"
    end
  end
end
