defmodule BeamToolbox.Category do
  use BeamToolbox.Web, :model

  schema "categories" do
    field :name, :string
    field :slug, :string
    has_many :projects, BeamToolbox.Project

    timestamps
  end

  @required_fields ~w(name slug)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
