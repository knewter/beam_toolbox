defmodule BeamToolbox.Controllers.Pages do
  use Phoenix.Controller

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
    BeamToolbox.project_data
      |> render_collection(&category_group_html/1)
  end

  defp category_group_html({name, categories}) do
    render_partial("category_group", [
      name: name,
      categories: render_categories(categories)
    ])
  end

  defp render_categories(categories) do
    categories |> render_collection(&category_html/1)
  end

  defp category_html({name, projects}) do
    render_partial("category", [
      name: name,
      projects: render_projects(projects)
    ])
  end

  defp render_projects(projects) do
    projects |> render_collection(&project_html/1)
  end

  defp project_html({name, url, github_url}) do
    render_partial("project", [
      name: name,
      url: url,
      github_url: github_url
    ])
  end

  defp render_collection(collection, renderer) do
    collection
      |> Enum.map(renderer)
      |> Enum.join
  end
end
