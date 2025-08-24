module TemperatureConvertor
  module Strategies
    class Rankine < BaseStrategy
      def to_celsius(value)
        (value - 491.67) * 5.0/9.0
      end

      def from_celsius(value)
        (value + 273.15) * 9.0/5.0
      end
    end
  end
end
