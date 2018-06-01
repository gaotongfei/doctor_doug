# frozen_string_literal: true

module DoctorDoug
  module Notify # :nodoc:
    def self.perform(checkup_name, violations)
      unless violations.empty?
        strategies = DoctorDoug.configuration.strategies
        strategies = valid_strategies(strategies)
        strategies.each do |strategy|
          case strategy
          when :mail
            DoctorDoug::Notify::Mail.new(DoctorDoug.configuration, violations: violations).deliver(checkup_name: checkup_name)
          when :slack
            DoctorDoug::Notify::SlackAdapter.new(DoctorDoug.configuration.slack_options, violations: violations).deliver(checkup_name: checkup_name)
          end
        end
      end
    end

    class << self
      def valid_strategies(strategies)
        [:mail, :slack] & strategies
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
        @violations.map(&:inspect).join(', ').to_s
      end
    end
  end
end
