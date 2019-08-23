if ENV["IP_WHITELIST"].present?

  allowed = Set.new[ENV["IP_WHITELIST"]]

  Rack::Attack.blocklist("block all access") do |req|
    # Requests are blocked if the return value is truthy
    !allowed.include? req.ip
  end
  
end