require 'logger'

module ErrorHandler
  def self.included(base)
    base.class_eval do
      error Sinatra::NotFound do
        content_type :json
        status 404
        { error: 'Not found', status: 404 }.to_json
      end

      error StandardError do
        content_type :json
        logger.error "Unhandled error: #{env['sinatra.error'].message}"
        logger.error env['sinatra.error'].backtrace.join("\n")
        
        status 500
        if settings.development?
          {
            error: 'Internal server error',
            message: env['sinatra.error'].message,
            backtrace: env['sinatra.error'].backtrace,
            status: 500
          }.to_json
        else
          { error: 'Internal server error', status: 500 }.to_json
        end
      end
    end
  end
end