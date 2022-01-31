# frozen_string_literal: true

module AlpacaDevice
  module AscomDevices
    class MetaInfo
      attr_reader :name, :type, :uuid

      def initialize(name:, type:, uuid:)
        @name = name
        @type = type
        @uuid = uuid
      end
    end
  end
end
