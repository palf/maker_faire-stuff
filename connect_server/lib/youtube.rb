require 'rack'

require './lib/xbmc_route'

module Hub
  class Youtube < XBMCRoute

    def self.call(env)
      query = env['QUERY_STRING']
      args = Rack::Utils.parse_nested_query(query)

      videoid = args['videoid'] #|| 'Y6ljFaKRTrI'
      youtube_plugin_command = "plugin://plugin.video.youtube/?action=play_video&videoid=#{videoid}"

      send_play_to_xbmc(youtube_plugin_command)
      return_ok()
    end

  end
end

