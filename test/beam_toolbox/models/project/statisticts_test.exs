defmodule BeamToolbox.Models.Project.StatisticsTest do
  use ExUnit.Case
  alias BeamToolbox.Models.Project.Statistics

  test "getting the latest commit date" do
    assert is_binary(Statistics.latest_commit_date("knewter/beam_toolbox"))
  end

  test "getting the stargazers count" do
    assert is_number(Statistics.stargazers_count("knewter/beam_toolbox"))
  end
end
