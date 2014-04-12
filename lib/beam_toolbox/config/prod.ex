defmodule BeamToolbox.Config.Prod do
  use BeamToolbox.Config

  config :router, port: System.get_env("PORT")
  config :plugs, code_reload: false
  config :logger, level: :error
end
