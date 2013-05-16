module Hub
  class Root

    def self.call(env)
      return_ok()
    end

    def self.return_ok()
      code = 200
      body = ['command sent']
      headers = {
        'Content-Type' => 'text/html',
        'Content-Length' => body[0].length.to_s
      }

      return [code, headers, body]
    end

  end
end
