require_relative 'base_strategy'

module TemperatureConvertor
  # Represents the Rankine temperature scale and its conversion formulas.
  class RankineStrategy < BaseStrategy
    # Converts a Rankine value to Celsius.
    # @param value [Numeric] The temperature in Rankine.
    # @return [Float] The temperature in Celsius.
    def to_celsius(value)
      (value - 491.67) * 5.0 / 9.0
    end

    # Converts a Celsius value to Rankine.
    # @param value [Numeric] The temperature in Celsius.
    # @return [Float] The temperature in Rankine.
    def from_celsius(value)
      (value + 273.15) * 9.0 / 5.0
    end
  end
end
