if ENV["IP_WHITELIST"].present?

  allowed = %w[ ENV["IP_WHITELIST"] ].to_set

  Rack::Attack.blocklist("block all access") do |req|
    # Requests are blocked if the return value is truthy
    !allowed.include? req.ip
  end

end