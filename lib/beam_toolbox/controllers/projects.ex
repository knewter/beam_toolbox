defmodule BeamToolbox.Controllers.Projects do
  use BeamToolbox.Controller, views_dir: "projects"
  alias BeamToolbox.Models.Project

  def show(conn) do
    render_view("show", conn, project_params(conn.params["project"]))
  end

  defp project_params(project_name) do
    project = fetch_project(project_name)
    [
      name: Project.name(project),
      website: Project.website(project),
      github: Project.github(project)
    ]
  end

  defp fetch_project(_project_name) do
    # TODO: Actually fetch the proper project from the data layer
    {:project, "Amrita", "http://amrita.io", "http://github.com/josephwilk/amrita"}
  end
end
