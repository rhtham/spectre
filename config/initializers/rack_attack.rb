if ENV["IP_WHITELIST"].present?

  allowed = ENV["IP_WHITELIST"]
  allowed = allowed.split(",")
  allowed.each { |ip_address|safelist_ip(ip_address) }

  Rack::Attack.blocklist("block all access") do |request|
    # Requests are blocked if the return value is truthy
    request.path.start_with?("/")
  end

end