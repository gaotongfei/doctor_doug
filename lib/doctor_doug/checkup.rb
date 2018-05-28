# frozen_string_literal: true

module DoctorDoug # :nodoc:
  def self.checkup(name, &block)
    checkup_proxy = CheckupProxy.new(name)
    checkup_proxy.instance_eval(&block)
  end

end

class CheckupProxy # :nodoc:
  def initialize(checkup_name)
    @checkup_name = checkup_name
  end

  def violate?(condition)
    return false unless [true, false].include?(condition)
    condition
  end

  def notify(condition, any:)
    raise NoneBlockGivenError unless block_given?
    collections = any
    violations = collections.map do |c|
      need_notify = false
      block_result = yield c
      need_notify = block_result if condition == :if
      need_notify = !block_result if condition == :unless
      c if need_notify
    end

    DoctorDoug::Notify.perform(checkup_name, violations)
  end

  private

  attr_reader :checkup_name

end
