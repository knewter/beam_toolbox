defmodule BeamToolbox.Models.CategoryGroupTest do
  use ExUnit.Case
  alias BeamToolbox.Models.CategoryGroup

  @test_data [
      {:category_group, "Testing", []},
      {:category_group, "Development Tools", []},
      {:category_group, "HTML and Markup", []}
    ]

  test "Listing CategoryGroups" do
    assert ["Testing", "Development Tools", "HTML and Markup"] == @test_data |> CategoryGroup.list
  end

  test "Finding a CategoryGroup by name" do
    assert Enum.at(@test_data, 1) == @test_data |> CategoryGroup.find("Development Tools")
  end
end
