require 'rack'

require './lib/xbmc_route'

module Hub
  class IPlayer < XBMCRoute

    def self.call(env)
      query = env['QUERY_STRING']
      args = Rack::Utils.parse_nested_query(query)

      pid = args['pid']
      playlisturl = args['playlisturl']

      if pid
        iplayer_plugin_command = "plugin://plugin.video.iplayer.palf/?pid=#{pid}"
      elsif playlisturl
        pid = get_pid_from_playlist(playlisturl)
        iplayer_plugin_command = "plugin://plugin.video.iplayer.palf/?pid=#{pid}"
        #iplayer_plugin_command = "plugin://plugin.video.iplayer.palf/?playlisturl=#{playlisturl}"
      else
        raise 'no pid or playlisturl'
      end

      send_play_to_xbmc(iplayer_plugin_command)
      return_ok()
    end

    def self.get_pid_from_playlist(playlisturl)
      matcher = /playlist\/(\w*)/
      matches = playlisturl.match(matcher)
      raise "invalid playlisturl: #{playlisturl}" unless matches
      matches[1]
    end

  end
end

