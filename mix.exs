defmodule BeamToolbox.Mixfile do
  use Mix.Project

  def project do
    [ app: :beam_toolbox,
      version: "0.0.1",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [
        :hackney,
        :exlager,
        :kernel,
        :stdlib,
        :elixir
      ],
      mod: { BeamToolbox, [] }
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      {:phoenix,   github: "knewter/phoenix", branch: "render_haml_with_calliope"},
      {:derp,      github: "meh/derp"},
      {:hound,     github: "knewter/hound", branch: "feature/elixir_v0.13_support"},
      {:httpoison, github: "knewter/httpoison", branch: "0.13_application_start_fix" },
      {:ibrowse, "~> 4.0.1", github: "cmullaparthi/ibrowse", override: true},
      {:exlager,   github: "khia/exlager"},
      {:markdown,  github: "knewter/markdown", branch: "feature/0.13-support"},
      {:cadfaerl,  github: "ddossot/cadfaerl"},
      {:exrm,      github: "bitwalker/exrm"}
    ]
  end
end
