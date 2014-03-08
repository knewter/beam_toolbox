defmodule BeamToolbox.Controllers.Projects do
  use BeamToolbox.Controller, views_dir: "projects"
  alias BeamToolbox.Models.Project

  def show(conn) do
    render_view("show", conn, project_params(conn.params["project"]))
  end

  defp project_params(project_name) do
    project = fetch_project(project_name)
    readme = Project.readme(project)
    [
      name: project.name,
      website: project.website,
      github: project.github,
      github_url: "http://github.com/" <> project.github,
      #latest_commit_date: Project.Statistics.latest_commit_date(project.github),
      #stargazers_count: (inspect Project.Statistics.stargazers_count(project.github)),
      #forks_count: (inspect Project.Statistics.forks_count(project.github))
      #description: Project.statistics.description(project.github)
      readme: readme,
      latest_commit_date: "lcd",
      stargazers_count: "15",
      forks_count: "42",
      description: "This thing, you know?  It's pretty cool..."
    ]
  end

  defp fetch_project(_project_name) do
    # TODO: Actually fetch the proper project from the data layer
    %Project{name: "Amrita", website: "http://amrita.io", github: "josephwilk/amrita"}
  end
end
