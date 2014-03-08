defmodule BeamToolbox.Data do
  alias BeamToolbox.Models.CategoryGroup
  alias BeamToolbox.Models.Category
  alias BeamToolbox.Models.Project

  ## FIXTURES / DUMMY DATA
  def category_groups do
    [
      %CategoryGroup{name: "Testing", categories:
        [
          %Category{name: "Integration Testing", projects:
            [
              %Project{name: "Amrita", website: "http://amrita.io", github: "josephwilk/amrita"},
              %Project{name: "Hound", website: "https://github.com/HashNuke/hound", github: "HashNuke/hound"}
            ]
          },
          %Category{name: "General Testing", projects:
            [
              %Project{name: "Common Test", website: "http://www.erlang.org/doc/apps/common_test/basics_chapter.html", github: ""},
              %Project{name: "EUnit", website: "http://www.erlang.org/doc/apps/eunit/chapter.html", github: ""},
              %Project{name: "Triq", website: "https://github.com/krestenkrab/triq", github: "krestenkrab/triq"},
              %Project{name: "test_server", website: "http://www.erlang.org/doc/man/test_server.html", github: ""},
              %Project{name: "tsung", website: "http://tsung.erlang-projects.org/", github: "processone/tsung"}
            ]
          }
        ]
      },
      %CategoryGroup{name: "Development Tools", categories:
        [
          %Category{name: "Code Reloading", projects:
            [
              %Project{name: "sync", website: "https://github.com/rustyio/sync", github: "rustyio/sync"},
              %Project{name: "active", website: "https://github.com/proger/active", github: "proger/active"}
            ]
          },
          %Category{name: "File System Monitoring", projects:
            [
              %Project{name: "erlfsmon", website: "https://github.com/proger/erlfsmon", github: "proger/erlfsmon"}
            ]
          }
        ]
      },
      %CategoryGroup{name: "HTML and Markup", categories:
        []
      }
    ]
  end

  def categories do
    Enum.map(category_groups, fn(%CategoryGroup{categories: categories}) -> categories end)
      |> List.flatten
  end

  def projects do
    Enum.map(categories, fn(%Category{projects: projects}) -> projects end)
      |> List.flatten
  end
end
