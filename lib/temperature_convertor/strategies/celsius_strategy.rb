require_relative 'base_strategy.rb'

module TemperatureConvertor
  module Strategies
    class Celsius < BaseStrategy
      def to_celsius(value)
        value
      end

      def from_celsius(value)
        value
      end
    end
  end
end
