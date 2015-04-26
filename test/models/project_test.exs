defmodule BeamToolbox.ProjectTest do
  use BeamToolbox.ModelCase

  alias BeamToolbox.Project

  @valid_attrs %{category_id: 42, details: "some content", key: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Project.changeset(%Project{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Project.changeset(%Project{}, @invalid_attrs)
    refute changeset.valid?
  end
end
