defmodule BeamToolbox.Controllers.Pages do
  use Phoenix.Controller
  alias BeamToolbox.Models.CategoryGroup
  alias BeamToolbox.Models.Category
  alias BeamToolbox.Models.Project

  def show(conn) do
    render_view("show", conn, [category_groups: render_category_groups])
  end

  defp render_view(name, conn), do: render_view(name, conn, [])
  defp render_view(name, conn, data) do
    html(conn, render(view(name), data))
  end
  defp view(name), do: File.read!("priv/views/pages/#{name}.html.haml")

  defp render_partial(name, data) do
    partial(name) |> render(data)
  end
  defp partial(name), do: File.read!("priv/views/pages/_#{name}.html.haml")

  defp render_category_groups do
    BeamToolbox.Data.category_groups
      |> render_collection(&category_group_html/1)
  end

  defp category_group_html(category_group) do
    render_partial("category_group", [
      name: CategoryGroup.name(category_group),
      categories: render_categories(CategoryGroup.categories(category_group))
    ])
  end

  defp render_categories(categories) do
    categories |> render_collection(&category_html/1)
  end

  defp category_html(category) do
    render_partial("category", [
      name: Category.name(category),
      projects: render_projects(Category.projects(category))
    ])
  end

  defp render_projects(projects) do
    projects |> render_collection(&project_html/1)
  end

  defp project_html(project) do
    render_partial("project", [
      name: Project.name(project),
      url: Project.website(project),
      github_url: Project.github(project)
    ])
  end

  defp render_collection(collection, renderer) do
    collection
      |> Enum.map(renderer)
      |> Enum.join
  end
end
