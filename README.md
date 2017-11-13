```
@dmarcoux/t

Pre-interview Task
```

# Introduction

Rails 5 JSON API for users and their tasks. Each user has different needs
regarding privacy, maintenance schedules and security. This explains why the
project deals with multiple databases.

# Usage

It is recommended to use Docker and Docker-Compose. The project has been tested
on Linux with Docker `17.10.0-ce` and Docker-Compose `1.17.0`.

# Application

1. Copy the environment file with `cp .env.example .env`
2. Start the application with `docker-compose up development`
3. Access it at `localhost:3000` (The port is the value of `$RAILS_PORT` from the file `.env`)
    1. TODO Example for endpoints

# Specs/Tests

1. TODO
