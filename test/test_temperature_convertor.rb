require "minitest/autorun"
require "temperature_convertor"

class TemperatureConvertor::ConvertorTest < Minitest::Test
  def test_celsius_to_fahrenheit
    temp = TemperatureConvertor::Temperature.new(100, TemperatureConvertor::Strategies::Celsius)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Fahrenheit)
    assert_equal 212, result
  end

  def test_fahrenheit_to_celsius
    temp = TemperatureConvertor::Temperature.new(212, TemperatureConvertor::Strategies::Fahrenheit)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Celsius)
    assert_equal 100, result
  end

  def test_celsius_to_kelvin
    temp = TemperatureConvertor::Temperature.new(0, TemperatureConvertor::Strategies::Celsius)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Kelvin)
    assert_equal 273.15, result
  end

  def test_kelvin_to_celsius
    temp = TemperatureConvertor::Temperature.new(273.15, TemperatureConvertor::Strategies::Kelvin)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Celsius)
    assert_equal 0, result
  end

  def test_fahrenheit_to_kelvin
    temp = TemperatureConvertor::Temperature.new(32, TemperatureConvertor::Strategies::Fahrenheit)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Kelvin)
    assert_in_delta 273.15, result, 0.01
  end

  def test_kelvin_to_fahrenheit
    temp = TemperatureConvertor::Temperature.new(273.15, TemperatureConvertor::Strategies::Kelvin)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Fahrenheit)
    assert_in_delta 32, result, 0.01
  end

  def test_celsius_to_rankine
    temp = TemperatureConvertor::Temperature.new(0, TemperatureConvertor::Strategies::Celsius)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Rankine)
    assert_in_delta 491.67, result, 0.01
  end

  def test_rankine_to_celsius
    temp = TemperatureConvertor::Temperature.new(491.67, TemperatureConvertor::Strategies::Rankine)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Celsius)
    assert_in_delta 0, result, 0.01
  end

  def test_fahrenheit_to_rankine
    temp = TemperatureConvertor::Temperature.new(32, TemperatureConvertor::Strategies::Fahrenheit)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Rankine)
    assert_in_delta 491.67, result, 0.01
  end

  def test_rankine_to_fahrenheit
    temp = TemperatureConvertor::Temperature.new(491.67, TemperatureConvertor::Strategies::Rankine)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Fahrenheit)
    assert_in_delta 32, result, 0.01
  end

  def test_kelvin_to_rankine
    temp = TemperatureConvertor::Temperature.new(273.15, TemperatureConvertor::Strategies::Kelvin)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Rankine)
    assert_in_delta 491.67, result, 0.01
  end

  def test_rankine_to_kelvin
    temp = TemperatureConvertor::Temperature.new(491.67, TemperatureConvertor::Strategies::Rankine)
    result = TemperatureConvertor::Convertor.convert(temp, TemperatureConvertor::Strategies::Kelvin)
    assert_in_delta 273.15, result, 0.01
  end
end