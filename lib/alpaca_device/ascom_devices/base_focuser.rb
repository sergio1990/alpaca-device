# frozen_string_literal: true

require_relative './base.rb'
require_relative './types.rb'
require_relative './meta_info.rb'

module AlpacaDevice
  module AscomDevices
    class BaseFocuser < Base
      attr_reader :absolute
      attr_reader :ismoving
      attr_reader :maxincrement
      attr_reader :maxstep
      attr_reader :position
      attr_reader :stepsize
      attr_reader :tempcomp
      attr_reader :tempcompavailable
      attr_reader :temperature

      def initialize(name:, uuid:)
        super(
          meta_info: MetaInfo.new(
            name: name,
            type: Type::FOCUSER,
            uuid: uuid
          )
        )
      end

      def set_tempcomp(tempcomp:)
        raise NotImplementedError
      end

      def set_halt
        raise NotImplementedError
      end

      def set_move(position:)
        raise NotImplementedError
      end
    end
  end
end
