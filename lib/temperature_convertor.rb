require_relative "temperature_convertor/version"
require_relative "temperature_convertor/temperature"
require_relative "temperature_convertor/strategies/base_strategy"
require_relative "temperature_convertor/strategies/celsius_strategy"
require_relative "temperature_convertor/strategies/fahrenheit_strategy"
require_relative "temperature_convertor/strategies/kelvin_strategy"
require_relative "temperature_convertor/strategies/rankine_strategy"

# Main module for the TemperatureConvertor gem.
module TemperatureConvertor
  # Custom error for when an invalid strategy is used for conversion.
  class InvalidStrategyError < StandardError; end

  # Provides a single public method to convert temperatures.
  class Convertor
    # Converts a Temperature object from its source scale to a target scale.
    # The conversion is done by first converting the source value to a common
    # intermediate scale (Celsius) and then converting from Celsius to the target scale.
    #
    # @param temperature [Temperature] The Temperature object to convert.
    # @param target_scale [Class] The target temperature strategy class (e.g., FahrenheitStrategy).
    # @raise [InvalidStrategyError] if the source or target scale is not a valid strategy.
    # @return [Float] The converted temperature value.
    #
    # @example
    #   temp = TemperatureConvertor::Temperature.new(100, TemperatureConvertor::CelsiusStrategy)
    #   TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::FahrenheitStrategy)
    #   #=> 212.0
    def self.convert(temperature, target_scale)
      source_strategy = temperature.scale.new
      target_strategy = target_scale.new

      # Guard clause to validate the source strategy
      unless source_strategy.respond_to?(:to_celsius)
        raise InvalidStrategyError, "The source scale '#{temperature.scale}' is not a valid strategy. It must implement a 'to_celsius' method."
      end

      # Guard clause to validate the target strategy
      unless target_strategy.respond_to?(:from_celsius)
        raise InvalidStrategyError, "The target scale '#{target_scale}' is not a valid strategy. It must implement a 'from_celsius' method."
      end

      celsius_value = source_strategy.to_celsius(temperature.value)
      target_strategy.from_celsius(celsius_value)
    end
  end
end
