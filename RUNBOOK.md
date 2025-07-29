# Rails API Runbook

## Setup Instructions

1. **Install dependencies**
   ```bash
   bundle install
   ```

2. **Set up database**
   ```bash
   bundle exec rails db:migrate
   ```

3. **Start the server**
   ```bash
   bundle exec rails server
   ```

4. **Server Configuration**
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