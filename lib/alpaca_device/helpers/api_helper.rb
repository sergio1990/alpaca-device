module AlpacaDevice
  module Helpers
    module ApiHelper
      TRANSACTION_MAX_VALUE = 4294967295
      def server_transaction_id
        (rand() * TRANSACTION_MAX_VALUE).round
      end
    end
  end
end
