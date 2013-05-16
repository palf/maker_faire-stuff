require 'rubygems'

require './lib/root'
require './lib/iplayer'
require './lib/youtube'



map '/' do
 run Hub::Root
end


map '/iplayer' do
 run Hub::IPlayer
end


map '/youtube' do
 run Hub::Youtube
end
