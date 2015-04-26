defmodule BeamToolbox.HexSynchronizerTest do
  use BeamToolbox.ModelCase
  alias BeamToolbox.HexSynchronizer
  alias BeamToolbox.Project

  @fake_hex_packages [
    %{"created_at" => "2014-04-23T03:53:36Z",
      "meta" => %{
        "contributors" => ["Paul Schoenfelder"],
        "description"  => "An IRC client library for Elixir.",
        "licenses"     => ["MIT"],
        "links"        => %{
                            "GitHub" => "https://github.com/bitwalker/exirc",
                            "Home Page" => "http://bitwalker.org/exirc"
                          }
         },
       "name" => "exirc",
       "updated_at" => "2014-07-31T05:46:38Z",
       "url" => "https://hex.pm/api/packages/exirc"},
    %{"created_at" => "2014-04-21T22:43:23Z",
      "meta" => %{
        "contributors" => ["Dickson S. Guedes"],
        "description" => "A simple Elixir implementation of JSON with an Erlang parser.\n",
        "licenses" => ["Apache 2.0"],
        "links" => %{"Github" => "https://github.com/guedes/exjson"}},
      "name" => "exjson", "updated_at" => "2014-04-23T02:56:05Z",
      "url" => "https://hex.pm/api/packages/exjson"},
   ]

  test "generates local projects for each Hex package" do
    HexSynchronizer.synchronize(@fake_hex_packages)
    assert Repo.count(Project) == 2
  end

  test "doesn't generate duplicates if a hex package already exists" do
    HexSynchronizer.synchronize(@fake_hex_packages)
    HexSynchronizer.synchronize(@fake_hex_packages)
    assert Repo.count(Project) == 2
  end
end
