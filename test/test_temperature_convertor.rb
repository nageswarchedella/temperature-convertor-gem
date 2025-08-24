require "minitest/autorun"
require "temperature_convertor"

class TemperatureConvertor::ConvertorTest < Minitest::Test
  class CustomStrategy
  end

  class IncompleteStrategy < TemperatureConvertor::Strategies::BaseStrategy
  end

  def setup
    @celsius    = TemperatureConvertor::Strategies::Celsius
    @fahrenheit = TemperatureConvertor::Strategies::Fahrenheit
    @kelvin     = TemperatureConvertor::Strategies::Kelvin
    @rankine    = TemperatureConvertor::Strategies::Rankine
  end
s
  def test_celsius_to_fahrenheit
    assert_conversion(100, from: @celsius, to: @fahrenheit, expected: 212)
  end

  def test_fahrenheit_to_celsius
    assert_conversion(212, from: @fahrenheit, to: @celsius, expected: 100)
  end

  def test_celsius_to_kelvin
    assert_conversion(0, from: @celsius, to: @kelvin, expected: 273.15)
  end

  def test_kelvin_to_celsius
    assert_conversion(273.15, from: @kelvin, to: @celsius, expected: 0)
  end

  def test_fahrenheit_to_kelvin
    assert_conversion(32, from: @fahrenheit, to: @kelvin, expected: 273.15)
  end

  def test_kelvin_to_fahrenheit
    assert_conversion(273.15, from: @kelvin, to: @fahrenheit, expected: 32)
  end

  def test_celsius_to_rankine
    assert_conversion(0, from: @celsius, to: @rankine, expected: 491.67)
  end

  def test_rankine_to_celsius
    assert_conversion(491.67, from: @rankine, to: @celsius, expected: 0)
  end

  def test_fahrenheit_to_rankine
    assert_conversion(32, from: @fahrenheit, to: @rankine, expected: 491.67)
  end

  def test_rankine_to_fahrenheit
    assert_conversion(491.67, from: @rankine, to: @fahrenheit, expected: 32)
  end

  def test_kelvin_to_rankine
    assert_conversion(273.15, from: @kelvin, to: @rankine, expected: 491.67)
  end

  def test_rankine_to_kelvin
    assert_conversion(491.67, from: @rankine, to: @kelvin, expected: 273.15)
  end

  def test_celsius_to_fahrenheit_with_negative_value
    assert_conversion(-10, from: @celsius, to: @fahrenheit, expected: 14)
  end

  def test_celsius_to_fahrenheit_with_float_value
    assert_conversion(37.5, from: @celsius, to: @fahrenheit, expected: 99.5)
  end

  def test_absolute_zero_conversions
    # Absolute zero in Kelvin is 0
    kelvin_temp = TemperatureConvertor::Temperature.new(0, @kelvin)

    # Convert 0 K to other scales
    celsius_val = TemperatureConvertor::Convertor.convert(kelvin_temp, @celsius)
    fahrenheit_val = TemperatureConvertor::Convertor.convert(kelvin_temp, @fahrenheit)
    rankine_val = TemperatureConvertor::Convertor.convert(kelvin_temp, @rankine)

    assert_in_delta(-273.15, celsius_val, 0.01)
    assert_in_delta(-459.67, fahrenheit_val, 0.01)
    assert_in_delta(0, rankine_val, 0.01)
  end

  def test_initialize_with_string_raises_error
    assert_raises(TypeError) do
      TemperatureConvertor::Temperature.new("a string", @celsius)
    end
  end

  def test_initialize_with_nil_raises_error
    assert_raises(TypeError) do
      TemperatureConvertor::Temperature.new(nil, @celsius)
    end
  end

  def test_invalid_source_strategy_raises_error
    assert_raises(TemperatureConvertor::InvalidStrategyError) do
      TemperatureConvertor::Convertor.convert(TemperatureConvertor::Temperature.new(100, CustomStrategy), @kelvin)
    end
  end

  def test_invalid_target_strategy_raises_error
    assert_raises(TemperatureConvertor::InvalidStrategyError) do
      TemperatureConvertor::Convertor.convert(TemperatureConvertor::Temperature.new(100, @celsius), CustomStrategy)
    end
  end

  def test_source_strategy_without_to_celsius_raises_error
    error = assert_raises(NotImplementedError) do
      temperature = TemperatureConvertor::Temperature.new(100, IncompleteStrategy)
      TemperatureConvertor::Convertor.convert(temperature, @celsius)
    end

    assert_match "Subclasses must implement a to_celsius method", error.message
  end

  def test_target_strategy_without_from_celsius_raises_error
    error = assert_raises(NotImplementedError) do
      temperature = TemperatureConvertor::Temperature.new(100, @celsius)
      TemperatureConvertor::Convertor.convert(temperature, IncompleteStrategy)
    end

    assert_match "Subclasses must implement a from_celsius method", error.message
  end

  private

  def assert_conversion(value, from:, to:, expected:)
    temperature = TemperatureConvertor::Temperature.new(value, from)
    result = TemperatureConvertor::Convertor.convert(temperature, to)
    assert_in_delta expected, result, 0.01
  end
end
