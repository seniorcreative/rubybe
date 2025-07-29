require_relative '../services/hello_service'

class HelloController < ApplicationController
  def index
    result = HelloService.get_greeting
    render json: { data: result, message: 'Hello World retrieved successfully' }
  end

  def show
    name = params[:name]
    result = HelloService.get_personalized_greeting(name)
    render json: { data: result, message: 'Personalized greeting retrieved successfully' }
  end

  def create
    name = params[:name]
    message = params[:message]
    
    if name.blank?
      render json: { error: 'Name is required' }, status: :bad_request
      return
    end
    
    result = HelloService.create_greeting(name, message)
    render json: { data: result, message: 'Custom greeting created successfully' }
  end
end