#! /usr/bin/ruby
# -*- coding: utf-8 -*-

require 'em-websocket'
require 'serialport'

port = "/dev/ttyACM0"

sp = SerialPort.new(port, 9600, 8, 1, SerialPort::NONE)

EventMachine::WebSocket.start(:host => "0.0.0.0",:port => 51234) do |ws|
	ws.onmessage { |msg|
		system(`/home/pi/mugbot-talk-1.1.sh #{msg}`)
	}
end