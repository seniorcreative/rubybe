require 'sinatra/base'
require 'json'

module BaseController
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def registered(app)
      app.helpers Helpers
    end
  end

  module Helpers
    def json_response(data, status = 200)
      status(status)
      data.to_json
    end

    def error_response(message, status = 400)
      json_response({ error: message, status: status }, status)
    end

    def success_response(data = {}, message = 'Success')
      json_response({ message: message, data: data, status: 200 })
    end

    def parse_json_body
      request.body.rewind
      JSON.parse(request.body.read)
    rescue JSON::ParserError
      halt 400, error_response('Invalid JSON')
    end

    def validate_required_params(params, required_fields)
      missing_fields = required_fields - params.keys
      return if missing_fields.empty?

      halt 400, error_response("Missing required fields: #{missing_fields.join(', ')}")
    end
  end
end