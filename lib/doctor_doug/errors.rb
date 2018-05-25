# frozen_string_literal: true

class NoneBlockGivenError < StandardError # :nodoc:
  def message
    'None block is given'
  end
end