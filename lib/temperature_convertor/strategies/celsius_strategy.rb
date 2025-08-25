require_relative 'base_strategy'

module TemperatureConvertor
  # Represents the Celsius temperature scale and its conversion formulas.
  class CelsiusStrategy < BaseStrategy
    # Converts a Celsius value to Celsius (identity).
    # @param value [Numeric] The temperature in Celsius.
    # @return [Numeric] The same temperature value.
    def to_celsius(value)
      value
    end

    # Converts a Celsius value from Celsius (identity).
    # @param value [Numeric] The temperature in Celsius.
    # @return [Numeric] The same temperature value.
    def from_celsius(value)
      value
    end
  end
end
