defmodule BeamToolbox.Controllers.Projects do
  use BeamToolbox.Controller, views_dir: "projects"

  def show(conn) do
    render_view("show", conn, project_params(conn.params["project"]))
  end

  defp project_params(project_name) do
    project = fetch_project(project_name)
    [
      name: project.name,
      website: project.website,
      github: project.github,
      github_url: "http://github.com/" <> project.github,
      latest_commit_date: Project.Statistics.latest_commit_date(project.github),
      stargazers_count: (inspect Project.Statistics.stargazers_count(project.github)),
      forks_count: (inspect Project.Statistics.forks_count(project.github)),
      description: Project.Statistics.description(project.github),
      readme: project |> Project.readme,
      sidebar: render_related_projects(project)
    ]
  end

  defp fetch_project(project_name) do
    Data.projects
      |> Enum.filter(fn(%Project{name: name}) -> Model.slug(name) == project_name end)
      |> hd
  end

  defp render_related_projects(project) do
    related_projects = Project.related_projects(project)
      |> Enum.map(fn(project) ->
           render_partial("related_project",
             name: project.name,
             path: Router.project_path(project: Model.slug(project.name))
           )
         end)
      |> Enum.join
    render_partial("related_projects",
      category: Project.category(project).name,
      related_projects: related_projects
    )
  end
end
