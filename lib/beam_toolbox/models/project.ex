defmodule BeamToolbox.Models.Project do
  use BeamToolbox.Model, tag: :project

  def name({:project, the_name, _website, _github}), do: the_name

  def website({:project, _name, website, _github}), do: website

  def github({:project, _name, _website, github}), do: github
end
