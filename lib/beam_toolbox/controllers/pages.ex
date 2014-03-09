defmodule BeamToolbox.Controllers.Pages do
  use BeamToolbox.Controller, views_dir: "pages"

  def show(conn) do
    render_view("show", conn, [category_groups: render_category_groups])
  end

  defp render_category_groups do
    BeamToolbox.Data.category_groups
      |> render_collection(&category_group_html/1)
  end

  defp category_group_html(category_group) do
    render_partial("category_group", [
      name: category_group.name,
      categories: render_categories(category_group.categories)
    ])
  end

  defp render_categories(categories) do
    categories |> render_collection(&category_html/1)
  end

  defp category_html(category) do
    render_partial("category", [
      name: category.name,
      projects: render_projects(category.projects)
    ])
  end

  defp render_projects(projects) do
    projects |> render_collection(&project_html/1)
  end

  defp project_html(project) do
    render_partial("project", [
      project_path: Router.project_path(project: Model.slug(project.name)),
      name: project.name,
      url: project.website,
      github_url: project.github
    ])
  end
end
