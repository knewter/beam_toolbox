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
          },
          {"General Testing",
            [
              {"Common Test", "http://www.erlang.org/doc/apps/common_test/basics_chapter.html", ""},
              {"EUnit", "http://www.erlang.org/doc/apps/eunit/chapter.html", ""},
              {"Triq", "https://github.com/krestenkrab/triq", "https://github.com/krestenkrab/triq"},
              {"test_server", "http://www.erlang.org/doc/man/test_server.html", ""},
              {"tsung", "http://tsung.erlang-projects.org/", "https://github.com/processone/tsung"}
            ]
          }
        ]
      },
      {"HTML and Markup",
        []
      }
    ]
  end
end
