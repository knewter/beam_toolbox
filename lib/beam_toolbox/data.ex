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
              %Project{name: "Amrita", website: "http://amrita.io", github: "http://github.com/josephwilk/amrita"},
              %Project{name: "Hound", website: "https://github.com/HashNuke/hound", github: "https://github.com/HashNuke/hound"}
            ]
          },
          %Category{name: "General Testing", projects:
            [
              %Project{name: "Common Test", website: "http://www.erlang.org/doc/apps/common_test/basics_chapter.html", github: ""},
              %Project{name: "EUnit", website: "http://www.erlang.org/doc/apps/eunit/chapter.html", github: ""},
              %Project{name: "Triq", website: "https://github.com/krestenkrab/triq", github: "https://github.com/krestenkrab/triq"},
              %Project{name: "test_server", website: "http://www.erlang.org/doc/man/test_server.html", github: ""},
              %Project{name: "tsung", website: "http://tsung.erlang-projects.org/", github: "https://github.com/processone/tsung"}
            ]
          }
        ]
      },
      %CategoryGroup{name: "Development Tools", categories:
        [
          %Category{name: "Code Reloading", projects:
            [
              %Project{name: "sync", website: "https://github.com/rustyio/sync", github: "https://github.com/rustyio/sync"},
              %Project{name: "active", website: "https://github.com/proger/active", github: "https://github.com/proger/active"}
            ]
          },
          %Category{name: "File System Monitoring", projects:
            [
              %Project{name: "erlfsmon", website: "https://github.com/proger/erlfsmon", github: "https://github.com/proger/erlfsmon"}
            ]
          }
        ]
      },
      %CategoryGroup{name: "HTML and Markup", categories:
        []
      }
    ]
  end
end
