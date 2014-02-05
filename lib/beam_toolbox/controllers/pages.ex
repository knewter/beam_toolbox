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
      |> Enum.map(&category_group_html/1)
      |> Enum.join("")
  end

  defp category_group_html({category_group_name, _categories}) do
    render_partial("category_group", [category_group_name: category_group_name])
  end
end
