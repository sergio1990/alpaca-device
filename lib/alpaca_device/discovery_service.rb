# frozen_string_literal: true

require 'socket'
require 'logger'

module AlpacaDevice
  class DiscoveryService
    def initialize(configuration:)
      @discovery_host = configuration.discovery_host
      @discovery_port = configuration.discovery_port
      @alpaca_port = configuration.alpaca_port

      @logger = Logger.new(STDOUT)
      @logger.level = :info
    end

    def run
      server = UDPSocket.new
      server.bind(discovery_host, discovery_port)

      logger.info('DiscoveryService') { "Discovery service started at #{discovery_host}:#{discovery_port}..." }

      loop do
        text, sender = server.recvfrom(24)
        remote_port = sender[1]
        remote_host = sender[3]

        logger.info('DiscoveryService') { "Received message '#{text}' from #{remote_host}:#{remote_port}" }

        if text == 'alpacadiscovery1'
          server.send "{\"alpacaport\": #{alpaca_port}}", 0, remote_host, remote_port
        end
      end

      server.close
    end

    private

    attr_reader :discovery_host, :discovery_port, :alpaca_port, :logger
  end
end
