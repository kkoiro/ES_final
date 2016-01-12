require 'serialport'
require 'yaml'

config = YAML.load_file('config.yml')
baud = 9600
data_bits = 8
stop_bits = 1
parity = 0

sp = SerialPort.new(config['bluetooth_port'], baud, data_bits, stop_bits, parity)
sp.read_timeout = 10000 #msec

while input = sp.gets.chomp!
	a = input.to_f.abs.floor
	p a
	break if a > 90
end
sp.close

exec("bundle exec ruby cmd_transmit.rb #{config['usb_port']} 1")
