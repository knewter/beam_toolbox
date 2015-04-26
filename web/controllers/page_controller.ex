defmodule BeamToolbox.PageController do
  use BeamToolbox.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
