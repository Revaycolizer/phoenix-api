# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :my_api,
  ecto_repos: [MyApi.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :my_api, MyApiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: MyApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: MyApi.PubSub,
  live_view: [signing_salt: "m5ru3jDK"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :my_api, MyApi.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

# Configure Origin
 config :cors_plug,
  origin: ["http://localhost:4000", "http://localhost:3001"],
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS","PATCH"],
  max_age: 86400,
  expose: ["Authorization"], # If you're sending back an Authorization header
  allow_credentials: true
import_config "#{config_env()}.exs"
