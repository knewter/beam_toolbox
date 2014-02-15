defmodule BeamToolbox.Models.ProjectTest do
  use ExUnit.Case
  alias BeamToolbox.Models.Project

  @test_data [
      # tag      name         website                          github
      {:project, "sync",   "https://github.com/rustyio/sync",  "https://github.com/rustyio/sync"},
      {:project, "active", "https://github.com/proger/active", "https://github.com/proger/active"}
    ]

  test "Listing Projects" do
    assert ["sync", "active"] == @test_data |> Project.list
  end

  test "Finding a Project by name" do
    assert Enum.at(@test_data, 1) == @test_data |> Project.find("active")
  end
end
