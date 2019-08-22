
Rack::Attack.safelist_ip("38.140.55.234")

Rack::Attack.blocklist("block all access") do |request|
  # Requests are blocked if the return value is truthy
  request.path.start_with?("/")
end