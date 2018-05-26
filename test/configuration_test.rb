# frozen_string_literal: true

require 'test_helper'

class ConfigurationTest < Minitest::Test
  def test_configuration
    DoctorDoug.configure do |config|
      config.strategies = [:mail]
      config.mail_options = {
          address: 'smtp.gmail.com',
          port: 587,
          domain: 'gmail.com',
          user_name: 'youremail@gmail.com',
          password: 'password',
          authentication: 'plain',
          from: 'from@gmail.com',
          to: 'to@gmail.com'
      }
    end

    assert_equal DoctorDoug.configuration.strategies, [:mail]
    assert_equal DoctorDoug.configuration.mail_options,
                 address: 'smtp.gmail.com',
                 port: 587,
                 domain: 'gmail.com',
                 user_name: 'youremail@gmail.com',
                 password: 'password',
                 authentication: 'plain',
                 from: 'from@gmail.com',
                 to: 'to@gmail.com'
  end
end
