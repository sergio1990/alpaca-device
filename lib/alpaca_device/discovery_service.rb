# frozen_string_literal: true

require 'socket'

module AlpacaDevice
  class DiscoveryService
    def initialize(configuration:)
      @discovery_host = configuration.discovery_host
      @discovery_port = configuration.discovery_port
      @alpaca_port = configuration.alpaca_port
    end

    def run
      server = UDPSocket.new
      server.bind(discovery_host, discovery_port)

      loop do
        text, sender = server.recvfrom(24)
        remote_port = sender[1]
        remote_host = sender[3]
        server.send "{\"alpacaport\": #{alpaca_port}}", 0, remote_host, remote_port
      end

      server.close
    end

    private

    attr_reader :discovery_host, :discovery_port, :alpaca_port
  end
end
