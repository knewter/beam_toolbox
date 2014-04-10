defmodule BeamToolbox do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    {:ok, _} = :cadfaerl.start_link(:github, 2000)
    BeamToolbox.GitHub.start
    BeamToolbox.Supervisor.start_link(System.get_env("PORT"))
  end
end
