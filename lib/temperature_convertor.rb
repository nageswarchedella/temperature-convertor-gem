# This file provides the main functionality for the TemperatureConvertor gem.

require_relative "temperature_convertor/version"

# This module provides a simple way to convert temperatures between different scales.
module TemperatureConvertor
  # A class for converting temperatures between different scales.
  class Convertor
    attr_accessor :value

    # Initializes a new TemperatureConvertor object.
    #
    # @param value [Numeric] The temperature value to convert.
    # @raise [TypeError] If the value is not a numeric type.
    def initialize(value)
      unless value.is_a?(Numeric)
        raise TypeError, "Expecting value to be a number or integer or floating point number"
      end
      @value = value
    end

    # Converts the stored value from Celsius to Fahrenheit.
    #
    # @return [Float] The temperature in Fahrenheit.
    def celcius_to_fahrenheit
      _celcius_to_fahrenheit(@value)
    end

    # Converts the stored value from Fahrenheit to Celsius.
    #
    # @return [Float] The temperature in Celsius.
    def fahrenheit_to_celcius
      _fahrenheit_to_celcius(@value)
    end

    # Converts the stored value from Celsius to Kelvin.
    #
    # @return [Float] The temperature in Kelvin.
    def celcius_to_kelvin
      _celcius_to_kelvin(@value)
    end

    # Converts the stored value from Kelvin to Celsius.
    #
    # @return [Float] The temperature in Celsius.
    def kelvin_to_celcius
      _kelvin_to_celcius(@value)
    end

    # Converts the stored value from Fahrenheit to Kelvin.
    #
    # @return [Float] The temperature in Kelvin.
    def fahrenheit_to_kelvin
      celcius = _fahrenheit_to_celcius(@value)
      _celcius_to_kelvin(celcius)
    end

    # Converts the stored value from Kelvin to Fahrenheit.
    #
    # @return [Float] The temperature in Fahrenheit.
    def kelvin_to_fahrenheit
      celcius = _kelvin_to_celcius(@value)
      _celcius_to_fahrenheit(celcius)
    end

    private

    # @private
    def _celcius_to_fahrenheit(value)
      (value * 9.0/5.0) + 32
    end

    # @private
    def _fahrenheit_to_celcius(value)
      (value - 32) * 5.0/9.0
    end

    # @private
    def _celcius_to_kelvin(value)
      value + 273.15
    end

    # @private
    def _kelvin_to_celcius(value)
      value - 273.15
    end
  end
end
