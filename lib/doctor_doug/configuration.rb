module DoctorDoug
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration # :nodoc:
    attr_accessor :strategies, :mail_options

    def initialize
      @strategies = [:mail]
    end
  end
end