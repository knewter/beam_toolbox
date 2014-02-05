defmodule BeamToolbox.Controllers.Pages do
  use Phoenix.Controller

  def show(conn) do
    render_view("show", conn)
  end

  defp render_view(name, conn), do: render_view(name, conn, [])
  defp render_view(name, conn, data) do
    haml(conn, view(name), data)
  end
  defp view(name), do: File.read!("priv/views/pages/#{name}.html.haml")
end
