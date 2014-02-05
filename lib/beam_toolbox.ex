defmodule BeamToolbox do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    BeamToolbox.Supervisor.start_link
  end

  ## FIXTURES / DUMMY DATA
  def project_data do
    [
      {"Testing",
        [
          {"Integration Testing",
            [
              {"Amrita", "http://amrita.io", "http://github.com/josephwilk/amrita"}
            ]
          }
        ]
      }
    ]
  end
end
