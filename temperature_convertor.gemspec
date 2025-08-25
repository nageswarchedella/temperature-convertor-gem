require_relative 'lib/temperature_convertor/version'

Gem::Specification.new do |s|
  s.name        = "temperature_convertor"
  s.version     = TemperatureConvertor::VERSION
  s.summary     = "Temperature convertor"
  s.description = "A simple gem to convert temperatures between Celsius, Fahrenheit, and Kelvin."
  s.authors     = ["Nageswar Chedella"]
  s.email       = "nageswarchedella@gmail.com"
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.homepage    = "https://github.com/nageswarchedella/TemperatureConvertor"
  s.license     = "MIT"
  s.executables << "temperature_convertor"
  s.require_paths = ["lib"]
end
