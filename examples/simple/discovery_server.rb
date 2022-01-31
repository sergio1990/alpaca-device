require 'alpaca_device'

AlpacaDevice.configure do |config|
  config.alpaca_port = 9000
end

AlpacaDevice::DiscoveryService.new(configuration: AlpacaDevice.config).run
