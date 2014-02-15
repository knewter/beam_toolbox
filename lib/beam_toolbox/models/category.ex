defmodule BeamToolbox.Models.Category do
  use BeamToolbox.Model, tag: :category

  def name({:category, the_name, _children}), do: the_name

  def projects({:category, _name, projects}), do: projects
end
