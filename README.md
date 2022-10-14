# redis-auth

Rails 7 API starter with Bcrypted user model, UUID's and configured with Redis user session storage, RSpec testing.

#### Curl cmds (& Postman form-data or raw json)

### Register/Create user

curl -XPOST -H "Content-Type: application/json" -d '{ "name": "random", "email": "randomuser@email.com", "password": "randpassword" } ' http://localhost:3000/users

##### Response:

{"id":"a6eb776c-67c3-4d71-947d-0917f1d31941","name":"random","username":"randomuser","email":"randomuser@email.com","password_digest":"$2a$12$MMtQ.WTu7g2MSQzfADXm3u7ANrwpQwJA6v3sye29TpLF8./Tu4gWi","created_at":"2022-10-14T18:04:13.453Z","updated_at":"2022-10-14T18:04:13.453Z"}

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
Set-Cookie: redis_session=bQOjFR%2BJ0FNznmu%2FYBAaEalROOPpKvkwqgwBUX7i4QPjLPpulIJh7aaAf60ueKrFFmBLZPDHTBd1IEn6bFaSz92OPh7x4duC8WjB1IpcLmTn7wOvoSBxW3Jxzo4RBVUgd%2FfLtfTXmD2xA%2FMpiNmrPSEMb3w%2FUU7IyJBdB1ZdEq72%2BeNceEJHwrMw8PZNMJQ2N2eSBgdXLhNpRekz9mFNYUk0B7NrlB4Ve%2BY57gLOfUW8X4zR1qk7nN0aBGhewDjgc8FWjcM%3D--IZs5ktReFMDtqp9R--cddfPzNHdJTPWtSKBAcCBw%3D%3D; path=/; HttpOnly; SameSite=Lax
ETag: W/"03e077255a5e9c3051cb05eba60fb16e"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d829b49b-38d7-41cc-a35c-ff078ae1f923
X-Runtime: 0.222001
Server-Timing: start_processing.action_controller;dur=0.15, sql.active_record;dur=1.08, instantiation.active_record;dur=0.10, process_action.action_controller;dur=217.77
Transfer-Encoding: chunked

{"token":{"public_id":"f2a3a360fd177ea25bc48a891989d51d"},"user":{"id":"a6eb776c-67c3-4d71-947d-0917f1d31941","name":"random","username":"randomuser","email":"randomuser@email.com","password_digest":"$2a$12$MMtQ.WTu7g2MSQzfADXm3u7ANrwpQwJA6v3sye29TpLF8./Tu4gWi","created_at":"2022-10-14T18:04:13.453Z","updated_at":"2022-10-14T18:04:13.453Z"}}

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
- db create, migrate

rails s

Try curl or Rest Client requests above,

- Params (no require user hash)

Register/create - name, email, password
Login - username, password

- Controllers user, and authentication for logins/sessions
- Models, 1 User only
- Testing, RSpec w FactoryBot

### RSpec

Basic tests only on User and login request.
