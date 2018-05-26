# frozen_string_literal: true

require 'mail'

module DoctorDoug
  module Notify
    class Mail < Base # :nodoc:
      def initialize(configuration, violations:)
        super(violations)
        @configuration = configuration

        ::Mail.defaults do
          delivery_method :smtp, configuration.mail_options.slice(:address, :port, :domain, :user_name,
                                                                  :password, :authentication)
        end
      end

      def deliver(checkup_name:)
        configuration = @configuration
        message = self.message
        mail = ::Mail.new do
          from configuration.mail_options[:from]
          to configuration.mail_options[:to]
          subject "Checkup: #{checkup_name} failed"
          body message
        end
        mail.deliver!
      end
    end
  end
end
