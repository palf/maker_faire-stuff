Given /^the ConnectServer is running at '(http:\/\/localhost:\d+)'$/ do |path|
  @server_location = path
end

Given /^XBMC is running at '(http:\/\/localhost:\d+)'$/ do |path|
  @xbmc_location = @path
end

When /^the client GETs '(.+)' from the server$/ do |path|
  full_path = @server_location + path
  @response = HTTParty.get(full_path)
end

Then /^XBMC receives the command '(.+)'$/ do |command|
  pending
end
