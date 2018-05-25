# frozen_string_literal: true

module DoctorDoug
  module Notify # :nodoc:
    def self.perform
      strategies = DoctorDoug.configuration.strategies
      strategies = valid_strategies(strategies)
      strategies.each do |strategy|
        DoctorDoug::Notify::Mail.new(DoctorDoug.configuration).deliver if strategy == :mail
        raise NotImplementedError if [:slack, :ding, :telegram].include?(strategy)
      end
    end

    class << self
      def valid_strategies(strategies)
        [:mail, :slack] & strategies
      end
    end


    class Base # :nodoc:
      def initialize
        # initialization
      end
    end
  end
end
