if ENV["IP_WHITELIST"].present?

  allowed = Set.new[ENV["IP_WHITELIST"]]
 
  allowed.each { |ip_address|Rack::Attack.safelist_ip(ip_address) }

  Rack::Attack.blocklist("block all access") do |request|
    # Requests are blocked if the return value is truthy
    request.path.start_with?("/")
  end

end