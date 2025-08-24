require "minitest/autorun"
require "temperature_convertor"

class TemperatureConvertor::ConvertorTest < Minitest::Test
  def setup
  end
  def test_celcius_to_fahrenheit
    # Arrange: Create a new TemperatureConvertor object with a value of 100 degrees Celsius.
    converter = TemperatureConvertor::Convertor.new(100)

    # Act: Call the method we want to test.
    result = converter.celcius_to_fahrenheit

    # Assert: Check if the result is what we expect (100 C is 212 F).
    assert_equal 212, result
  end

  def test_fahrenheit_to_celcius
    converter = TemperatureConvertor::Convertor.new(212)
    result = converter.fahrenheit_to_celcius
    assert_equal 100, result
  end

  def test_celcius_to_kelvin
    converter = TemperatureConvertor::Convertor.new(0)
    result = converter.celcius_to_kelvin
    assert_equal 273.15, result
  end

  def test_kelvin_to_celcius
    converter = TemperatureConvertor::Convertor.new(273.15)
    result = converter.kelvin_to_celcius
    assert_equal 0, result
  end

  def test_fahrenheit_to_kelvin
    converter = TemperatureConvertor::Convertor.new(32)
    result = converter.fahrenheit_to_kelvin
    assert_in_delta 273.15, result, 0.01
  end

  def test_kelvin_to_fahrenheit
    converter = TemperatureConvertor::Convertor.new(273.15)
    result = converter.kelvin_to_fahrenheit
    assert_in_delta 32, result, 0.01
  end

  def test_initialize_with_string_raises_error
    assert_raises(TypeError) do
      TemperatureConvertor::Convertor.new("a string")
    end
  end

  def test_initialize_with_nil_raises_error
    assert_raises(TypeError) do
      TemperatureConvertor::Convertor.new(nil)
    end
  end

  def test_celcius_to_fahrenheit_at_zero
    converter = TemperatureConvertor::Convertor.new(0)
    assert_equal 32, converter.celcius_to_fahrenheit
  end

  def test_celcius_to_fahrenheit_with_negative_value
    converter = TemperatureConvertor::Convertor.new(-10)
    assert_equal 14, converter.celcius_to_fahrenheit
  end

  def test_celcius_to_fahrenheit_with_float_value
    converter = TemperatureConvertor::Convertor.new(37.5)
    assert_in_delta 99.5, converter.celcius_to_fahrenheit
  end

  def test_value_accessor
    converter = TemperatureConvertor::Convertor.new(10)
    assert_equal 10, converter.value

    converter.value = 20
    assert_equal 20, converter.value
  end
end
