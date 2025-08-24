module TemperatureConvertor
  module Strategies
    class Kelvin
      def to_celsius(value)
        value - 273.15
      end

      def from_celsius(value)
        value + 273.15
      end
    end
  end
end
