# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :guardian_token_demo,
  ecto_repos: [GuardianTokenDemo.Repo]

# Configures the endpoint
config :guardian_token_demo, GuardianTokenDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UgIKaLFkQSwzAh+dYXMbZZv7W/b5wpfVDH4y/JVK+yuOhhYjzLkP8deHvLer4MHv",
  render_errors: [view: GuardianTokenDemoWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: GuardianTokenDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian_token_demo, GuardianTokenDemo.Guardian,
  issuer: "guardian_token_demo",
  verify_issuer: true,
  secret_key: "Z0823tDeL3Rvp5NnwQ0Z6smzIdlukPfl8n7b8rIoIh+BQVVHdfv6uz11I/ybXex6",
  token_ttl: %{"refresh" => {30, :days}, "access" => {15, :minute}}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
