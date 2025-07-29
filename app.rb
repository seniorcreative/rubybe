require 'sinatra/base'
require 'sinatra/namespace'
require 'dotenv/load'
require 'logger'
require_relative 'config/application'
require_relative 'lib/base_controller'
require_relative 'app/controllers/hello_controller'

class App < Sinatra::Base
  register Sinatra::Namespace

  configure do
    set :logging, true
    set :dump_errors, false
    set :raise_errors, true
    set :show_exceptions, false
  end

  configure :development do
    set :dump_errors, true
    set :show_exceptions, true
  end

  before do
    content_type :json
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization'
  end

  options '*' do
    200
  end

  namespace '/api/v1' do
    register HelloController
  end

  not_found do
    { error: 'Not found', status: 404 }.to_json
  end

  error do
    logger.error "Error: #{env['sinatra.error']}"
    { error: 'Internal server error', status: 500 }.to_json
  end
end