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
    1. Create a user:
    ```shell
    curl --verbose --header "Content-Type: application/json" --data '{ "user": {"email":"me@example.com","password":"'12345'"} }' localhost:3000/users
    ```
    2. Login with the user:
    ```shell
    curl --verbose --header "Content-Type: application/json" --data '{ "auth": {"email":"me@example.com","password":"'12345'"} }' localhost:3000/user_token
    ```
    3. Create a task for the user:
    ```shell
    curl --verbose --header "Authorization: Bearer TOKEN_FROM_LOGIN_REQUEST" --header "Content-Type: application/json" --data '{ "task": { "start":"2017-11-16T16:28:54+01:00", "end":"2017-11-16T17:28:54+01:00", "description":"Something" } }' localhost:3000/tasks
    ```
    4. List tasks of the user:
    ```shell
    curl --verbose --header "Authorization: Bearer TOKEN_FROM_LOGIN_REQUEST" localhost:3000/tasks
    ```

# Development

1. Start the development environment with `docker-compose run --service-ports development bash`
    1. Run specs/tests with: TODO
    2. Run code style checks with: `rubocop`
