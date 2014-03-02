defmodule BeamToolbox.DataTest do
  use ExUnit.Case
  alias BeamToolbox.Data

  def type_of(data) do
    [first|_rest] = Data.category_groups
    {type, _, _} = first
    type
  end

  test "it can list category_groups" do
    assert type_of(Data.category_groups) == :category_group
  end
end
