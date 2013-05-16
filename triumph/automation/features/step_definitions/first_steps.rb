Given /^I launch (the .+ app)$/ do |app|
  app.launch()
end

Given /^(\d+) seconds pass$/ do |delay|
  sleep(delay.to_i)
end

Given /^I stop (the .+ app)$/ do |app|
  app.stop()
end

Transform /^the Triumph app$/ do |x|
  triumph_app
end
