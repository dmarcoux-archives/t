```
@dmarcoux/t

Pre-interview Task
```

# Introduction

Rails 5 JSON API for users and their tasks. Each user has different needs
regarding privacy, maintenance schedules and security. To respect this, each
user has a database for his/her tasks. As for users, they are stored in a single
database.

# Setup

1. Install Docker and Docker-Compose (Tested on Linux with versions `17.10.0-ce`
   and `1.17.0` respectively)
2. Copy the environment file with `cp .env.example .env`
3. Copy the secrets file with `cp config/secrets.yml.example config/secrets.yml`
   and change values inside the file

# Application

1. Start the application with `docker-compose up development`
2. Access it at `localhost:3000` (The port is the value of `$RAILS_PORT` from the file `.env`)
    1. Create a user: `curl --verbose --header "Content-Type: application/json" --data '{ "user": {"email":"me@example.com","password":"'12345'"} }' localhost:3000/users`
    2. Login with the new user: `curl --verbose --header "Content-Type: application/json" --data '{ "auth": {"email":"me@example.com","password":"'12345'"} }' localhost:3000/user_token`

# Development

1. Start the development environment with `docker-compose run --service-ports development bash`
    1. Run specs/tests with: TODO
    2. Run code style checks with: `rubocop` (TODO: Fix issues)
