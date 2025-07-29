# Rails API Runbook

## Setup Instructions

1. **Install dependencies**
   ```bash
   bundle install
   ```

2. **Set up Rails environment** (if missing)
   ```bash
   # Create Rakefile if it doesn't exist
   echo "require_relative 'config/application'
Rails.application.load_tasks" > Rakefile

   # Create bin directory and Rails scripts if missing
   mkdir -p bin
   
   # Create bin/rails
   cat > bin/rails << 'EOF'
#!/usr/bin/env ruby
APP_PATH = File.expand_path('../config/application', __dir__)
require_relative '../config/boot'
require 'rails/commands'
EOF

   # Create bin/rake
   cat > bin/rake << 'EOF'
#!/usr/bin/env ruby
require_relative '../config/boot'
require 'rake'
Rake.application.run
EOF

   # Make scripts executable
   chmod +x bin/rails bin/rake
   ```

3. **Set up database**
   ```bash
   bundle exec rails db:migrate
   ```

4. **Start the server**
   ```bash
   bundle exec rails server
   ```

5. **Server Configuration**
   - Default port: 3000
   - Environment: development (default)

## API Endpoints

- **GET /api/v1/hello** - Basic greeting
- **GET /api/v1/hello/:name** - Personalized greeting  
- **POST /api/v1/hello** - Custom greeting with JSON body

## Development Commands

- **Run tests**: `bundle exec rspec`
- **Console**: `bundle exec rails console`
- **Routes**: `bundle exec rails routes`

## Environment Variables

- `RAILS_ENV` - Set environment (development, test, production)
- `PORT` - Override default port