require 'serialport'
require 'yaml'

config = YAML.load_file('config.yml')
serial_port = configARGV[0]
baud = 9600
data_bits = 8
stop_bits = 1
parity = 0
p "start"

sp = SerialPort.new(serial_port, baud, data_bits, stop_bits, parity)
sp.write ARGV[1]
p ARGV[1]
