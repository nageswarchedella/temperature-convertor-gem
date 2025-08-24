require "minitest/autorun"
require "temperature_convertor"

class TemperatureConvertor::ConvertorTest < Minitest::Test
  def setup
    @celsius    = TemperatureConvertor::Strategies::Celsius
    @fahrenheit = TemperatureConvertor::Strategies::Fahrenheit
    @kelvin     = TemperatureConvertor::Strategies::Kelvin
    @rankine    = TemperatureConvertor::Strategies::Rankine
  end

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

  def test_celsius_to_fahrenheit_with_negative_value
    assert_conversion(-10, from: @celsius, to: @fahrenheit, expected: 14)
  end

  def test_celsius_to_fahrenheit_with_float_value
    assert_conversion(37.5, from: @celsius, to: @fahrenheit, expected: 99.5)
  end

  private

  def assert_conversion(value, from:, to:, expected:)
    temperature = TemperatureConvertor::Temperature.new(value, from)
    result = TemperatureConvertor::Convertor.convert(temperature, to)
    assert_in_delta expected, result, 0.01
  end
end
