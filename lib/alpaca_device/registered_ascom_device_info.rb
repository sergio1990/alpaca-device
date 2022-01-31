# frozen_string_literal: true

module AlpacaDevice
  class RegisteredAscomDeviceInfo
    attr_reader :name
    attr_reader :type  
    attr_reader :number
    attr_reader :uuid

    def initialize(name:, type:, number:, uuid:)
      @name = name
      @type = type
      @number = number
      @uuid = uuid
    end
  end
end
