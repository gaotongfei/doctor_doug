# frozen_string_literal: true

module DoctorDoug
  module Notify
    class SlackAdapter < Base # :nodoc:
      def initialize(slack_options, violations:)
        super(violations)
        @slack_options = slack_options
      end

      def client
        @client ||= ::Slack::Web::Client.new(token: slack_options[:token])
      end

      def deliver(checkup_name:)
        message = self.message
        client.chat_postMessage(channel: slack_options[:channel], text: "#{checkup_name}: #{message}", as_user: true)
      end

      private

      attr_reader :slack_options
    end
  end
end
