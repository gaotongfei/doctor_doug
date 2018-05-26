# frozen_string_literal: true

module DoctorDoug
  module Notify # :nodoc:
    def self.perform(checkup_name, violations)
      unless violations.empty?
        strategies = DoctorDoug.configuration.strategies
        strategies = valid_strategies(strategies)
        strategies.each do |strategy|
          if strategy == :mail
            DoctorDoug::Notify::Mail.new(DoctorDoug.configuration, violations: violations).deliver(checkup_name: checkup_name)
          end
        end
      end
    end

    class << self
      def valid_strategies(strategies)
        [:mail] & strategies
      end
    end
  end
end

module DoctorDoug
  module Notify
    class Base # :nodoc:
      def initialize(violations)
        @violations = violations
      end

      def message
        "#{@violations.inspect}"
      end
    end
  end
end
