require 'logger'

class Configuration
  attr_reader :logger, :port, :environment

  def initialize
    @environment = ENV.fetch('RACK_ENV', 'development')
    @port = ENV.fetch('PORT', '4567').to_i
    @logger = Logger.new($stdout)
    @logger.level = log_level
  end

  private

  def log_level
    case @environment
    when 'production'
      Logger::INFO
    when 'test'
      Logger::ERROR
    else
      Logger::DEBUG
    end
  end
end

CONFIG = Configuration.new