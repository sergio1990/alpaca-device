# frozen_string_literal: true

require_relative './base_focuser.rb'

module AlpacaDevice
  module AscomDevices
    class BaseFocuserV3 < BaseFocuser
      def initialize(name:, uuid:)
        super

        @interfaceversion = 3
      end
    end
  end
end

