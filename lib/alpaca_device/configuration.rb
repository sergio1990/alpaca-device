# frozen_string_literal: true

module AlpacaDevice
  class Configuration
    attr_accessor :discovery_host
    attr_accessor :discovery_port
    attr_accessor :alpaca_port

    def initialize
      @discovery_host = "0.0.0.0"
      @discovery_port = 32227
    end
  end
end
