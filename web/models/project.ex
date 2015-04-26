defmodule BeamToolbox.Project do
  use BeamToolbox.Web, :model

  schema "projects" do
    field :key, :string
    field :details, :string
    belongs_to :category, BeamToolbox.Category

    timestamps
  end

  @required_fields ~w(key details category_id)
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

  def by_key(key) do
    from(p in BeamToolbox.Project, where: p.key == ^key)
  end
end
