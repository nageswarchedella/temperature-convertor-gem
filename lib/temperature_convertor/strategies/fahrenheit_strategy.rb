require_relative 'base_strategy'

module TemperatureConvertor
  # Represents the Fahrenheit temperature scale and its conversion formulas.
  class FahrenheitStrategy < BaseStrategy
    # Converts a Fahrenheit value to Celsius.
    # @param value [Numeric] The temperature in Fahrenheit.
    # @return [Float] The temperature in Celsius.
    def to_celsius(value)
      (value - 32) * 5.0 / 9.0
    end

    # Converts a Celsius value to Fahrenheit.
    # @param value [Numeric] The temperature in Celsius.
    # @return [Float] The temperature in Fahrenheit.
    def from_celsius(value)
      (value * 9.0 / 5.0) + 32
    end
  end
end
