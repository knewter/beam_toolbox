defmodule BeamToolbox.Controllers.Categories do
  use BeamToolbox.Controller, views_dir: "categories"

  def index(conn) do
    render_view("index", conn, [categories: categories])
  end

  def show(conn) do
    render_view("show", conn, category_params(conn.params["category"]))
  end

  def category_params(category_name) do
    category = fetch_category(category_name)
    [
      name: category.name,
      projects: render_projects(category.projects)
    ]
  end

  defp render_projects(projects) do
    render_collection(projects, &render_project/1)
  end

  defp categories do
    render_collection(Data.categories, &render_category/1)
  end

  defp render_category(category) do
    render_partial("category", [
      name: category.name,
      url: Router.category_path(category: Model.slug(category.name))
    ])
  end

  defp render_project(project) do
    render_partial("project", [
      name: project.name,
      url: Router.project_path(project: Model.slug(project.name))
    ])
  end

  defp fetch_category(category_name) do
    Data.categories
      |> Enum.filter(fn(%Category{name: name}) -> Model.slug(name) == category_name end)
      |> hd
  end
end
