defmodule BeamToolbox.DataTest do
  use ExUnit.Case
  alias BeamToolbox.Data
  alias BeamToolbox.Models.CategoryGroup

  def type_of(data) do
    [first|_rest] = Data.category_groups
    {type, _, _} = first
    type
  end

  test "it can list category_groups" do
    assert hd(Data.category_groups).__struct__ == CategoryGroup
  end
end
