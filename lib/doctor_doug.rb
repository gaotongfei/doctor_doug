# frozen_string_literal: true

require 'doctor_doug/version'
require 'doctor_doug/checkup'
require 'doctor_doug/errors'
require 'doctor_doug/configuration'
require 'doctor_doug/notify/base'
require 'doctor_doug/notify/mail'
require 'doctor_doug/notify/slack_adapter'

require 'mail'
require 'slack-ruby-client'

module DoctorDoug # :nodoc:
end
