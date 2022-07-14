# frozen_string_literal: true

module AlpacaDevice
  module AscomDevices
    module Type
      CAMERA = "Camera"
      COVER_CALIBRATOR = "CoverCalibrator"
      DOME = "Dome"
      FILTER_WHEEL = "FilterWheel"
      FOCUSER = "Focuser"
      OBSERVING_CONDITIONS = "ObservingConditions"
      ROTATOR = "Rotator"
      SAFETY_MONITOR = "SafetyMonitor"
      SWITCH = "Switch"
      TELESCOPE = "Telescope"

      ALL = [
        CAMERA,
        COVER_CALIBRATOR,
        DOME,
        FILTER_WHEEL,
        FOCUSER,
        OBSERVING_CONDITIONS,
        ROTATOR,
        SAFETY_MONITOR,
        SWITCH,
        TELESCOPE
      ]

      def self.convert(raw:)
        ALL.find { |type| type.downcase == raw.downcase }
      end
    end
  end
end
