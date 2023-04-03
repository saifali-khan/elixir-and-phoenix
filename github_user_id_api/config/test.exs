import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :github_user_id_api, GithubUserIdApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "syKQlLCeUNoUk7xqbEkKs8mOXLqpPiNwqIjUxDjHKE6KTM7m6+DyU9O3ETO5vn9r",
  server: false

# In test we don't send emails.
config :github_user_id_api, GithubUserIdApi.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
