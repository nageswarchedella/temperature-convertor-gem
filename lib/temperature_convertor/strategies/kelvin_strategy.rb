require_relative 'base_strategy'

module TemperatureConvertor
  # Represents the Kelvin temperature scale and its conversion formulas.
  class KelvinStrategy < BaseStrategy
    # Converts a Kelvin value to Celsius.
    # @param value [Numeric] The temperature in Kelvin.
    # @return [Float] The temperature in Celsius.
    def to_celsius(value)
      value - 273.15
    end

    # Converts a Celsius value to Kelvin.
    # @param value [Numeric] The temperature in Celsius.
    # @return [Float] The temperature in Kelvin.
    def from_celsius(value)
      value + 273.15
    end
  end
end
