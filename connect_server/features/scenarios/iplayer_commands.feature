@iplayer
Feature: iPlayer Commands

  This server will be used to pass the controls from one device to another,
  and convert them into the correct format en route.

  Scenario: Pass a PID over
    Given the ConnectServer is running at 'http://localhost:3000'
    And XBMC is running at 'http://localhost:3001'

    When the client GETs '/iplayer?action=play&playlisturl=http%3A%2F%2Fwww.bbc.co.uk%2Fiplayer%2Fplaylist%2Fb01s5hth' from the server
    Then XBMC receives the command 'plugin://plugin.video.iplayer.palf/?action=play_video&videoid=b01s5hth'
