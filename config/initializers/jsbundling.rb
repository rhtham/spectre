# Set the preferred JavaScript package manager
if Rails.env.development? || Rails.env.test?
  ENV["JAVASCRIPT_PACKAGE_MANAGER"] ||= "npm"
end
