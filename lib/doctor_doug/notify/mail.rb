# frozen_string_literal: true

require 'mail'

module DoctorDoug
  module Notify
    class Mail < Base # :nodoc:
      def initialize(configuration)
        @configuration = configuration
        ::Mail.defaults do
          delivery_method :smtp, configuration.mail_options.slice(:address, :port, :domain, :user_name,
                                                                  :password, :authentication)
        end
      end

      def deliver
        configuration = @configuration
        mail = ::Mail.new do
          from configuration.mail_options[:from]
          to configuration.mail_options[:to]
          subject 'Doctor Doug'
          body 'hohoho'
        end
        mail.deliver!
      end
    end
  end
end
