module TemperatureConvertor
  class Temperature
    attr_reader :value, :scale

    def initialize(value, scale)
      unless value.is_a?(Numeric)
        raise TypeError, "Expecting value to be a number or integer or floating point number"
      end
      @value = value
      @scale = scale
    end
  end
end
