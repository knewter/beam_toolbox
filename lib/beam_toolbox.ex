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
              {"Amrita", "http://amrita.io", "http://github.com/josephwilk/amrita"},
              {"Hound", "https://github.com/HashNuke/hound", "https://github.com/HashNuke/hound"}
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
      {"Development Tools",
        [
          {"Code Reloading",
            [
              {"sync", "https://github.com/rustyio/sync", "https://github.com/rustyio/sync"},
              {"active", "https://github.com/proger/active", "https://github.com/proger/active"}
            ]
          },
          {"File System Monitoring",
            [
              {"erlfsmon", "https://github.com/proger/erlfsmon", "https://github.com/proger/erlfsmon"}
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
