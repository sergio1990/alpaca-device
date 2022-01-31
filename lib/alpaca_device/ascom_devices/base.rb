# frozen_string_literal: true

module AlpacaDevice
  module AscomDevices
    class Base
      attr_reader :connected
      attr_reader :description
      attr_reader :driverinfo
      attr_reader :driverversion
      attr_reader :interfaceversion
      attr_reader :name
      attr_reader :supportedactions

      attr_reader :type
      attr_reader :uuid

      def initialize(meta_info:)
        @meta_info = meta_info
        @name = meta_info.name
        @type = meta_info.type
        @uuid = meta_info.uuid
      end

      def set_action(action:, parameters:)
        raise NotImplementedError
      end

      def set_commandblind(command:, raw:)
        raise NotImplementedError
      end

      def set_commandbool(command:, raw:)
        raise NotImplementedError
      end

      def set_commandstring(command:, raw:)
        raise NotImplementedError
      end

      def set_connected(connected:)
        raise NotImplementedError
      end
    end
  end
end
