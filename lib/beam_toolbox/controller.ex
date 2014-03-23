defmodule BeamToolbox.Controller do
  import Phoenix.Controller

  defmacro __using__(opts) do
    {:ok, views_dir} = Keyword.fetch(opts, :views_dir)
    quote do
      use Phoenix.Controller
      alias BeamToolbox.Router
      alias BeamToolbox.Models.Category
      alias BeamToolbox.Data
      alias BeamToolbox.Model
      alias BeamToolbox.Models.Project
      alias BeamToolbox.Models.Category
      alias BeamToolbox.Models.CategoryGroup

      defp render_view(name, conn), do: render_view(name, conn, [])
      defp render_view(name, conn, data) do
        {sidebar, data} = data |> Dict.pop(:sidebar)
        rendered_view = render(view(name), data)
        rendered_layout = render(layout("application"), [
          content: rendered_view,
          sidebar: sidebar || ""
        ])
        html(conn, rendered_layout)
      end
      defp view(name), do: read_priv("/views/#{unquote(views_dir)}/#{name}.html.haml")
      defp layout(name), do: read_priv("/views/layouts/#{name}.html.haml")

      defp render_partial(name, data) do
        partial(name) |> render(data)
      end
      defp partial(name), do: read_priv("/views/#{unquote(views_dir)}/_#{name}.html.haml")

      defp render_collection(collection, renderer) do
        collection
          |> Enum.map(renderer)
          |> Enum.join
      end

      defp read_priv(path) do
        File.read!("#{:code.lib_dir(:beam_toolbox, :priv)}#{path}")
      end
    end
  end
end
