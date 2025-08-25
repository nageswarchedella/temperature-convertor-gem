module TemperatureConvertor
  # Base class for all temperature conversion strategies.
  # Subclasses must implement `to_celsius` and `from_celsius`.
  class BaseStrategy
    # Converts a value from the implementing scale to Celsius.
    # @param value [Numeric] The temperature value to convert.
    # @raise [NotImplementedError] if the subclass does not implement this method.
    # @return [Float] The temperature in Celsius.
    def to_celsius(value)
      raise NotImplementedError, "Subclasses must implement a to_celsius method"
    end

    # Converts a value from Celsius to the implementing scale.
    # @param value [Numeric] The temperature value in Celsius to convert.
    # @raise [NotImplementedError] if the subclass does not implement this method.
    # @return [Float] The temperature in the target scale.
    def from_celsius(value)
      raise NotImplementedError, "Subclasses must implement a from_celsius method"
    end
  end
end
