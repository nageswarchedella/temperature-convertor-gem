require_relative "temperature_convertor/version"
require_relative "temperature_convertor/temperature"
require_relative "temperature_convertor/strategies/celsius_strategy"
require_relative "temperature_convertor/strategies/fahrenheit_strategy"
require_relative "temperature_convertor/strategies/kelvin_strategy"
require_relative "temperature_convertor/strategies/rankine_strategy"

module TemperatureConvertor
  # A class for converting temperatures between different scales.
  class Convertor
    # Converts a Temperature object to a target scale.
    #
    # @param temperature [Temperature] The Temperature object to convert.
    # @param target_scale [Class] The target temperature scale.
    # @return [Float] The converted temperature value.
    def self.convert(temperature, target_scale)
      celsius_value = temperature.scale.new.to_celsius(temperature.value)
      target_scale.new.from_celsius(celsius_value)
    end
  end
end