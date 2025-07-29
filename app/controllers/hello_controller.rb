require 'sinatra/base'
require_relative '../../lib/base_controller'
require_relative '../services/hello_service'

module HelloController
  include BaseController

  def self.registered(app)
    super

    app.get '/hello' do
      result = HelloService.get_greeting
      success_response(result, 'Hello World retrieved successfully')
    end

    app.get '/hello/:name' do
      name = params[:name]
      result = HelloService.get_personalized_greeting(name)
      success_response(result, 'Personalized greeting retrieved successfully')
    end

    app.post '/hello' do
      body = parse_json_body
      validate_required_params(body, ['name'])
      
      result = HelloService.create_greeting(body['name'], body['message'])
      success_response(result, 'Custom greeting created successfully')
    end
  end
end