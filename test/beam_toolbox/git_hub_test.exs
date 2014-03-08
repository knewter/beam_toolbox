defmodule BeamToolbox.GitHubTest do
  use ExUnit.Case
  alias BeamToolbox.GitHub, as: GH

  test "fetches the most recent commit" do
    commit = "knewter/beam_toolbox"
               |> GH.latest_commit
    assert is_binary(commit["commit"]["committer"]["date"])
  end
end
