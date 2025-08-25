module TemperatureConvertor
  # A data object representing a temperature value and its scale.
  class Temperature
    # @return [Numeric] the value of the temperature.
    attr_reader :value
    # @return [Class] the strategy class for the temperature's scale.
    attr_reader :scale

    # Initializes a new Temperature object.
    #
    # @param value [Numeric] The numerical value of the temperature.
    # @param scale [Class] The strategy class representing the scale (e.g., CelsiusStrategy).
    # @raise [TypeError] if the value is not a Numeric type.
    def initialize(value, scale)
      unless value.is_a?(Numeric)
        raise TypeError, "Expecting value to be a number or integer or floating point number"
      end

      @value = value
      @scale = scale
    end
  end
end
