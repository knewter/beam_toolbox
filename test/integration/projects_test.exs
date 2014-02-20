defmodule Integration.ProjectsTest do
  use ExUnit.Case, async: true
  use Hound.Helpers

  hound_session

  test "A project renders its name", meta do
    navigate_to("http://localhost:4000/projects/Amrita")

    assert "Amrita" == visible_text({:class, "project_name"})
  end

  test "A project renders its website", meta do
    navigate_to("http://localhost:4000/projects/Amrita")

    assert "http://amrita.io" == visible_text({:class, "project_website"})
  end

  test "A project renders its github", meta do
    navigate_to("http://localhost:4000/projects/Amrita")

    assert "http://github.com/josephwilk/amrita" == visible_text({:class, "project_github"})
  end
end
