require 'xbmc'

require './lib/root'

module Hub
  class XBMCRoute < Root

    def self.send_play_to_xbmc(link)
      puts "playing video from: #{link}"

      @xbmc_location = 'http://192.168.56.1:8081'

      controller = XBMC::Controller.new(@xbmc_location)
      controller.play(link)
    end

  end
end
