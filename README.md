## Temperature Convertor
`TemperatureConvertor` is a gem provides Temperature conversions with ease.

## Available Temperature scales
* Celsius
* Fahrenheit
* Kelvin
* Rankine

## Usage
 
```ruby
# select your scale
@celsius    = TemperatureConvertor::CelsiusStrategy
@fahrenheit = TemperatureConvertor::FahrenheitStrategy
@kelvin     = TemperatureConvertor::KelvinStrategy
@rankine    = TemperatureConvertor::RankineStrategy
# Absolute zero in Kelvin is 0
# use any base scale(from scale)
kelvin_temp = TemperatureConvertor::Temperature.new(0, @kelvin)

# Convert 0 K to other scales
# convert to any scale by sending the desired scales
celsius_val = TemperatureConvertor::Convertor.convert(kelvin_temp, @celsius)
fahrenheit_val = TemperatureConvertor::Convertor.convert(kelvin_temp, @fahrenheit)
rankine_val = TemperatureConvertor::Convertor.convert(kelvin_temp, @rankine)
```

## Using custom Scale
```ruby
class NewtonStrategy < TemperatureConvertor::BaseStrategy
  def to_celsius(value)
    value.to_f * 100 / 33
  end

  def from_celsius(value)
    value.to_f * 33 / 100
  end
end

# from Newton scale
newton_tem = TemperatureConvertor::Temperature.new(0, NewtonStrategy)
# to celsius scale
celsius_val = TemperatureConvertor::Convertor.convert(newton_tem, TemperatureConvertor::CelsiusStrategy)
```

