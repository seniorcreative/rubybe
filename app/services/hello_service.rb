class HelloService
  def self.get_greeting
    {
      message: 'Hello, World!',
      timestamp: Time.now.iso8601,
      version: '1.0.0'
    }
  end

  def self.get_personalized_greeting(name)
    sanitized_name = sanitize_name(name)
    {
      message: "Hello, #{sanitized_name}!",
      timestamp: Time.now.iso8601,
      personalized: true
    }
  end

  def self.create_greeting(name, custom_message = nil)
    sanitized_name = sanitize_name(name)
    message = custom_message || "Hello, #{sanitized_name}!"
    
    {
      message: message,
      name: sanitized_name,
      timestamp: Time.now.iso8601,
      custom: !custom_message.nil?
    }
  end

  private_class_method def self.sanitize_name(name)
    name.to_s.strip.gsub(/[^a-zA-Z0-9\s]/, '')[0..50]
  end
end