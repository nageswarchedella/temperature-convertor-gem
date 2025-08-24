module TemperatureConvertor
  class Temperature
    attr_reader :value, :scale

    def initialize(value, scale)
      @value = value
      @scale = scale
    end
  end
end
