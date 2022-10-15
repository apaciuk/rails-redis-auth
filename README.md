# redis-auth

Rails 7 API starter with Bcrypted user model, UUID's and configured with Redis user registration & session storage, RSpec testing.

#### Curl cmds (& Postman form-data or raw json)

### Register/Create user

curl -XPOST -H "Content-Type: application/json" -d '{ "name": "random", "email": "randomuser@email.com", "password": "randpassword" } ' http://localhost:3000/users

##### Response:

{"id":"89107f80-856d-4561-887e-63079e7ca26f","name":"random","username":"randomuser","email":"randomuser@email.com","password_digest":"$2a$12$5GYMEA/KD.ta96g9vJKX1OehxZB.FFZzcCUpFcN9w3wXsVttCoF2e","role":"user","status":"inactive","created_at":"2022-10-15T13:47:55.685Z","updated_at":"2022-10-15T13:47:55.685Z"}

### Login user

curl -XPOST -i -H "Content-Type: application/json" -d '{ "username": "randomuser", "password": "randpassword" }' http://localhost:3000/login

##### Response: HTTP/1.1 200 OK

HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 0
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
Vary: Accept
Set-Cookie: redis_session=v597fQ7U1E5CA3ismuZRWyRxElxooQVJyfI90QMax1cK2qThJdOLXKHOVo%2Bt8wDIV4wwtfAjYWDZCBn3qbF5HS%2BJyUkPGQLLWi0BsSgcLfB721Pl7b7yqIeA4chb5W2%2FKM%2BKrNDrVSsXTMSQTCkqQPRB06lmP4fMEiTUjN1GA6WrTim1srUe0azw4%2F08KYWtaBEvRkfLyjd3nHXGreStQUoU%2BHSBWfl7TRA9uj1LiBJht7R%2BQ4cSh1Vx5msFz92nYabjzJU%3D--e8SnQzpjKoisU3JS--ijj0cwHTXK8J4TtIKSfmUw%3D%3D; path=/; HttpOnly; SameSite=Lax
ETag: W/"6c788ec3385ab1d87e3a35b4856bcba2"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 39eed6bb-a47e-4617-891d-fbef514f323d
X-Runtime: 0.243467
Server-Timing: start_processing.action_controller;dur=0.31, sql.active_record;dur=1.21, instantiation.active_record;dur=0.12, process_action.action_controller;dur=216.68
Transfer-Encoding: chunked

{"token":{"public_id":"1fbedd62f5bb8ca8cfe0a673ba5bc8d1"},"user":{"id":"89107f80-856d-4561-887e-63079e7ca26f","name":"random","username":"randomuser","email":"randomuser@email.com","password_digest":"$2a$12$5GYMEA/KD.ta96g9vJKX1OehxZB.FFZ

#### Routes

                                   users GET    /users(.:format)                                                                                  users#index
                                         POST   /users(.:format)                                                                                  users#create
                                    user GET    /users/:id(.:format)                                                                              users#show
                                         PATCH  /users/:id(.:format)                                                                              users#update
                                         PUT    /users/:id(.:format)                                                                              users#update
                                         DELETE /users/:id(.:format)                                                                              users#destroy
                                   login POST   /login(.:format)                                                                                  authentication#authenticate

### Set up

cp \_env.example as .env (contains just Redis env constants)

Redis, main config preset in application.rb, with a redis-namespace initializer in config/initializers/redis.rb

- Ruby version

  2.7.0 (Rails 7)

- bundle install
- db create, migrate, seed (optional)

rails s

Try curl or Rest Client requests above,

- Params (not require user hash)

Register/create - name, email, password
Login - username, password

- Controllers user, and authentication for logins/sessions
- Models, 1 User only, and example Message model
- Testing, RSpec w FactoryBot

### RSpec

Basic tests only on User and login request + Message
