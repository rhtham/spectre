if ENV["IP_WHITELIST"].present?

  allowed = ENV["IP_WHITELIST"]

  Rack::Attack.blocklist("block all access") do |request|
    # Requests are blocked if the return value is truthy
    request.path.start_with?("/")
  end

end