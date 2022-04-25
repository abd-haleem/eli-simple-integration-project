# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chat,
  ecto_repos: [Chat.Repo]

# Configures the endpoint
config :chat, ChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5a6hZmFjBMDzmpN0j8AfQarIiHk7j9Sp39/io03NbfSJP997rI0D/GvisfobM+5b",
  render_errors: [view: ChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Chat.PubSub,
  live_view: [signing_salt: "5XBWclH9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# config :schedular, Chat.Quantum,
#   # debug_logging: false,
#   jobs: [
#     # {{:extended, "* * * * * *"}, {IO, :puts, ["Haleem: HI Rey"]}}, # Every second
#     # {{:extended, "*/3 * * * * *"}, {IO, :puts, ["Rey: Yeeeee hello"]}}, # Every 3 second
#     {"* * * * *", {Chat.Chats, :create_message, []}}, # Every minute
#     {"@minutely", fn -> IO.puts("Schedular is working") end}, # Every minute
#     # {"47 * * * *", fn -> IO.puts("Hello odd guys") end} # at __:29
#   ]
