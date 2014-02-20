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
      applications: [],
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
      {:phoenix, github: "knewter/phoenix", branch: "render_haml_with_calliope"},
      {:derp,    github: "meh/derp"},
      {:hound,   github: "HashNuke/hound", tag: "v0.5.2"}
    ]
  end
end
