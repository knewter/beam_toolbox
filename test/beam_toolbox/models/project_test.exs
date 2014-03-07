defmodule BeamToolbox.Models.ProjectTest do
  use ExUnit.Case
  alias BeamToolbox.Models.Project

  @test_data [
    %Project{name: "sync", website: "https://github.com/rustyio/sync", github: "https://github.com/rustyio/sync"},
    %Project{name: "active", website: "https://github.com/proger/active", github: "https://github.com/proger/active"}
  ]

  test "Listing Projects" do
    assert ["sync", "active"] == @test_data |> Project.list
  end

  test "Finding a Project by name" do
    assert Enum.at(@test_data, 1) == @test_data |> Project.find("active")
  end
end
