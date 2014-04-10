defmodule BeamToolbox.Config.Dev do
  use BeamToolbox.Config

  config :router, port: System.get_env("PORT") || "4000",
                  ssl: false

  config :plugs, code_reload: true

  config :logger, level: :debug
end
