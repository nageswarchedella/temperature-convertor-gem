module TemperatureConvertor
  module Strategies
    class BaseStrategy
      def to_celsius(value)
        raise NotImplementedError, "Subclasses must implement a to_celsius method"
      end

      def from_celsius(value)
        raise NotImplementedError, "Subclasses must implement a from_celsius method"
      end
    end
  end
end
