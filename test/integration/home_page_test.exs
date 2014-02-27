defmodule Integration.HomePageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session

  test "The home page has BEAM Toolbox as its title", meta do
    navigate_to("http://localhost:4000/pages/home")

    assert "BEAM Toolbox" == page_title
  end
end
