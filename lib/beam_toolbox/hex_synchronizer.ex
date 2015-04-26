defmodule BeamToolbox.HexSynchronizer do
  alias BeamToolbox.Project
  alias BeamToolbox.Repo

  def synchronize(packages) do
    packages
    |> Enum.map &find_or_create/1
  end

  defp find_or_create(details) do
    key = details["name"]
    IO.puts inspect details
    {:ok, details_encoded} = Poison.encode(details)
    existing_project = Project.by_key(key) |> Repo.one
    case existing_project do
      nil ->
        %Project{key: key, details: details_encoded}
        |> Repo.insert
      _   ->
        %Project{existing_project | details: details_encoded}
        |> Repo.update
    end
  end
end
