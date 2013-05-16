@youtube
Feature: YouTube Commands

  This server will be used to pass the controls from one device to another,
  and convert them into the correct format en route.

  Scenario: Pass a PID over
    Given the ConnectServer is running at 'http://localhost:3000'
    And XBMC is running at 'http://localhost:3001'

    When the client GETs '/youtube?videoid=Y6ljFaKRTrI' from the server
    Then XBMC receives the command 'plugin://plugin.video.youtube/?action=play_video&videoid=Y6ljFaKRTrI'
    And starts playing 'Still Alive'
