defmodule BeamToolbox.Models.CategoryTest do
  use ExUnit.Case
  alias BeamToolbox.Models.Category

  @test_data [
      {:category, "Code Reloading", []},
      {:category, "File System Monitoring", []}
    ]

  test "Listing Categories" do
    assert ["Code Reloading", "File System Monitoring"] == @test_data |> Category.list
  end

  test "Finding a Category by name" do
    assert Enum.at(@test_data, 1) == @test_data |> Category.find("File System Monitoring")
  end
end
