defmodule BeamToolbox.Models.Project do
  defstruct [:name, :website, :github]
  use BeamToolbox.Model
  alias BeamToolbox.Mock.GitHub
  alias BeamToolbox.Data

  def category(project) do
    Data.categories
      |> Enum.filter(fn(c) -> Enum.member?(c.projects, project) end)
      |> hd
  end

  def related_projects(project) do
    category(project).projects
      |> Enum.filter(fn(proj) -> proj !== project end)
  end

  def readme_raw(project), do: GitHub.Raw.readme(project.github)
  def readme(project), do: project |> readme_raw |> Markdown.to_html(tables: true, fenced_code: true, autolink: true)

  defmodule Statistics do
    import Enum

    def stargazers_count(""), do: "N/A"
    def stargazers_count(repo_ident), do: repo_ident |> GitHub.stargazers |> count

    def forks_count(""), do: "N/A"
    def forks_count(repo_ident), do: repo_ident |> GitHub.forks |> count

    def latest_commit_date(""), do: "N/A"
    def latest_commit_date(repo_ident) do
      GitHub.latest_commit(repo_ident)["commit"]["committer"]["date"]
    end

    def description(""), do: "N/A"
    def description(repo_ident) do
      repo = repo_ident |> GitHub.repo
      repo["description"]
    end
  end
end
