# frozen_string_literal: true

require_relative './registered_ascom_device_info'

module AlpacaDevice
  class Configuration
    attr_accessor :discovery_host
    attr_accessor :discovery_port
    attr_accessor :alpaca_port

    attr_accessor :description_name
    attr_accessor :description_creator
    attr_accessor :description_version
    attr_accessor :description_location

    def initialize
      @discovery_host = "0.0.0.0"
      @discovery_port = 32227

      @registered_devices = {}
    end

    def register_ascom_device(ascom_device)
      normalized_type = ascom_device.type.downcase
      registered_devices[normalized_type] ||= []
      registered_devices[normalized_type] << ascom_device
    end

    def registered_ascom_devices_info
      registered_devices.map do |normalized_type, registered_devices|
        registered_devices.each_with_index.map do |device, index|
          RegisteredAscomDeviceInfo.new(
            name: device.name,
            type: device.type,
            number: index,
            uuid: device.uuid
          )
        end
      end.flatten
    end

    def ascom_device(type, number)
      registered_devices[type.downcase][number]
    end

    private

    attr_reader :registered_devices
  end
end
