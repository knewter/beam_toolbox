defmodule BeamToolbox.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :key, :string
      add :details, :text
      add :category_id, :integer

      timestamps
    end
  end
end
