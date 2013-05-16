class ThisWorld
  attr_reader :triumph_app

  def initialize()
    @triumph_app = Randroid::Application.new('palf.triumph')
  end
end


World {
  ThisWorld.new()
}



module Randroid ; end

class Randroid::Application
  def initialize(app_id)
    @app_id = app_id
  end

  def launch(intent = 'AppEntry')
    `adb shell am start -W #{@app_id}/.#{intent}`
  end

  def stop()
    `adb shell am force-stop #{@app_id}`
  end
end
