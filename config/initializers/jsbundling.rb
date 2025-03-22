# Set the JavaScript package manager to use
if File.exist?("#{Rails.root}/yarn.lock")
  ENV["JAVASCRIPT_PACKAGE_MANAGER"] ||= "yarn"
elsif File.exist?("#{Rails.root}/package-lock.json")
  ENV["JAVASCRIPT_PACKAGE_MANAGER"] ||= "npm"
elsif File.exist?("#{Rails.root}/bun.lockb")
  ENV["JAVASCRIPT_PACKAGE_MANAGER"] ||= "bun"
else
  ENV["JAVASCRIPT_PACKAGE_MANAGER"] ||= "npm"
end
