defmodule BeamToolbox.Router do
  alias BeamToolbox.Controllers
  use Phoenix.Router,
        port: 4000,
        dispatch: [
          { :_, [
              {"/stylesheets/[...]", :cowboy_static, {:dir, "priv/static/stylesheets"}},
              {:_, Plug.Adapters.Cowboy.Handler, { __MODULE__, [] }}
          ]}
        ]

  get "pages/:page", Controllers.Pages, :show, as: :page
end
