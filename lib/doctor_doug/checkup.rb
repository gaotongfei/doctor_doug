# frozen_string_literal: true

module DoctorDoug # :nodoc:
  def self.checkup(name, &block)
    checkup_proxy = CheckupProxy.new(name)
    checkup_proxy.instance_eval(&block)
  end

end

class CheckupProxy # :nodoc:
  def initialize(name)
    @name = name
  end

  def notify(condition, any:)
    raise NoneBlockGivenError unless block_given?
    collections = any
    collections.each do |c|
      block_result = yield c
      if !!block_result == block_result
        need_notify = block_result if condition == :if
        need_notify = !block_result if condition == :unless
        DoctorDoug::Notify.perform if need_notify
      end
    end
  end

  private

  attr_reader :name
end
