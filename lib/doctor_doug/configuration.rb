# frozen_string_literal: true

module DoctorDoug
  # Configure doctor_doug using block style
  #
  # For example:
  #
  #   # config/initializers/doctor_doug.rb
  #   DoctorDoug.configure do |config|
  #     config.strategies = [:mail]
  #     config.mail_options = {
  #       address: "smtp.gmail.com",
  #       port: 587,
  #       domain: 'gmail.com',
  #       user_name: 'youremail@gmail.com',
  #       password: 'password',
  #       authentication: 'plain',
  #       from: 'from@gmail.com',
  #       to: 'to@gmail.com'
  #     }
  #     config.slack_options = {
  #       token: 'aabbcc',
  #       channel: '#general'
  #     }
  #   end
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration # :nodoc:
    attr_accessor :strategies, :mail_options, :slack_options

    def initialize
      @strategies = [:mail]
    end
  end
end