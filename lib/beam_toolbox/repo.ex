defmodule BeamToolbox.Repo do
  use Ecto.Repo, otp_app: :beam_toolbox
  import Ecto.Query, only: [from: 2]

  # I'm assuming this is a bad thing to put in Repo but don't have a great feel for it yet sooooo
  def count(model) do
    from(p in model, select: count(p.id))
    |> one
  end
end
