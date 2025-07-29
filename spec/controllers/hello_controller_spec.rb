require_relative '../spec_helper'

RSpec.describe 'HelloController' do
  describe 'GET /api/v1/hello' do
    it 'returns a hello world message' do
      get '/api/v1/hello'
      
      expect(last_response).to be_ok
      response_body = JSON.parse(last_response.body)
      expect(response_body['message']).to eq('Hello World retrieved successfully')
      expect(response_body['data']['message']).to eq('Hello, World!')
    end
  end

  describe 'GET /api/v1/hello/:name' do
    it 'returns a personalized greeting' do
      get '/api/v1/hello/John'
      
      expect(last_response).to be_ok
      response_body = JSON.parse(last_response.body)
      expect(response_body['data']['message']).to eq('Hello, John!')
      expect(response_body['data']['personalized']).to be true
    end
  end

  describe 'POST /api/v1/hello' do
    it 'creates a custom greeting' do
      post '/api/v1/hello', { name: 'Alice' }.to_json, { 'CONTENT_TYPE' => 'application/json' }
      
      expect(last_response).to be_ok
      response_body = JSON.parse(last_response.body)
      expect(response_body['data']['name']).to eq('Alice')
      expect(response_body['data']['custom']).to be false
    end

    it 'creates a custom greeting with message' do
      post '/api/v1/hello', { name: 'Bob', message: 'Welcome Bob!' }.to_json, { 'CONTENT_TYPE' => 'application/json' }
      
      expect(last_response).to be_ok
      response_body = JSON.parse(last_response.body)
      expect(response_body['data']['message']).to eq('Welcome Bob!')
      expect(response_body['data']['custom']).to be true
    end

    it 'returns error for missing name' do
      post '/api/v1/hello', {}.to_json, { 'CONTENT_TYPE' => 'application/json' }
      
      expect(last_response.status).to eq(400)
      response_body = JSON.parse(last_response.body)
      expect(response_body['error']).to include('Missing required fields: name')
    end
  end
end