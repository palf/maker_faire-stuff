  Before do
  start_server()
end


After do
  stop_server()
end





def start_server()
  `thin start -d`
  sleep 1
end

def stop_server()
  `thin stop`
end
