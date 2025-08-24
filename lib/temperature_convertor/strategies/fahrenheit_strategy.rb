module TemperatureConvertor
  module Strategies
    class Fahrenheit < BaseStrategy
      def to_celsius(value)
        (value - 32) * 5.0/9.0
      end

      def from_celsius(value)
        (value * 9.0/5.0) + 32
      end
    end
  end
end
