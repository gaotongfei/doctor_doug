# frozen_string_literal: true

module DoctorDoug
  module Notify # :nodoc:
    def self.perform
      puts 'performing'
    end
    
    class Base # :nodoc:
      def initialize
        # initialization
      end
    end
  end
end
