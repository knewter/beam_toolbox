defmodule BeamToolbox.Router do
  alias BeamToolbox.Controllers
  use Phoenix.Router, port: @port

  plug Plug.Static, at: "/static", from: :beam_toolbox

  get "/pages/:page", Controllers.Pages, :show, as: :page
  get "/projects/:project", Controllers.Projects, :show, as: :project
  get "/categories", Controllers.Categories, :index, as: :categories
  get "/categories/:category", Controllers.Categories, :show, as: :category

  def start_link, do: start
end
