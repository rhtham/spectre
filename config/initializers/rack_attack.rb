if ENV["IP_WHITELIST"].present?

  allowed = ENV["IP_WHITELIST"]

  if ENV["GP_OFFICE_CIDR"].present?
    Rack::Attack.safelist_ip(ENV["GP_OFFICE_CIDR"])
  end

  Rack::Attack.blocklist("block all access") do |req|
    # Requests are blocked if the return value is truthy
    !allowed.include? req.ip
  end

end