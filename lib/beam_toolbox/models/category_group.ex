defmodule BeamToolbox.Models.CategoryGroup do
  use BeamToolbox.Model, tag: :category_group

  def name({:category_group, the_name, _children}), do: the_name

  def categories({:category_group, _name, categories}), do: categories
end
