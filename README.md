```
@dmarcoux/t

Pre-interview Task
```

# Introduction

Rails 5 JSON API for users and their tasks. Each user has different needs
regarding privacy, maintenance schedules and security. This explains why the
project deals with multiple databases.

# Setup

1. Install Docker and Docker-Compose (Tested on Linux with versions `17.10.0-ce`
   and `1.17.0` respectively)
2. Copy the environment file with `cp .env.example .env`
3. Copy the secrets file with `cp config/secrets.yml.example config/secrets.yml`
   and change values inside the file

# Application

1. Start the application with `docker-compose up development`
2. Access it at `localhost:3000` (The port is the value of `$RAILS_PORT` from the file `.env`)
    1. TODO Example for endpoints

# Development

1. Start the development environment with `docker-compose run development bash`
    1. Run specs/tests with: TODO
    2. Run code style checks with: `rubocop` (TODO: Fix issues)
