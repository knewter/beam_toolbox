defmodule BeamToolbox.Supervisor do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    # See http://elixir-lang.org/docs/stable/Supervisor.Behaviour.html
    # for other strategies and supported options
    BeamToolbox.GitHub.start

    children = [
      worker(:cadfaerl, [:github, 2000]),
      worker(BeamToolbox.Router, [], function: :start)
    ]
    supervise(children, strategy: :one_for_one)
  end
end
