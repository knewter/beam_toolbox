defmodule BeamToolbox.Data do
  ## FIXTURES / DUMMY DATA
  def category_groups do
    [
      {:category_group, "Testing",
        [
          {:category, "Integration Testing",
            [
              {:project, "Amrita", "http://amrita.io", "http://github.com/josephwilk/amrita"},
              {:project, "Hound", "https://github.com/HashNuke/hound", "https://github.com/HashNuke/hound"}
            ]
          },
          {:category, "General Testing",
            [
              {:project, "Common Test", "http://www.erlang.org/doc/apps/common_test/basics_chapter.html", ""},
              {:project, "EUnit", "http://www.erlang.org/doc/apps/eunit/chapter.html", ""},
              {:project, "Triq", "https://github.com/krestenkrab/triq", "https://github.com/krestenkrab/triq"},
              {:project, "test_server", "http://www.erlang.org/doc/man/test_server.html", ""},
              {:project, "tsung", "http://tsung.erlang-projects.org/", "https://github.com/processone/tsung"}
            ]
          }
        ]
      },
      {:category_group, "Development Tools",
        [
          {:category, "Code Reloading",
            [
              {:project, "sync", "https://github.com/rustyio/sync", "https://github.com/rustyio/sync"},
              {:project, "active", "https://github.com/proger/active", "https://github.com/proger/active"}
            ]
          },
          {:category, "File System Monitoring",
            [
              {:project, "erlfsmon", "https://github.com/proger/erlfsmon", "https://github.com/proger/erlfsmon"}
            ]
          }
        ]
      },
      {:category_group, "HTML and Markup",
        []
      }
    ]
  end
end
