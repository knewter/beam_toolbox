defmodule BeamToolbox.Models.Project do
  defstruct [:name, :website, :github]
  use BeamToolbox.Model
  alias BeamToolbox.GitHub
  alias BeamToolbox.Mock

  def readme_raw(project), do: Mock.GitHub.Raw.readme(project.github)
  def readme(project), do: project |> readme_raw |> Markdown.to_html(tables: true, fenced_code: true, autolink: true)

  defmodule Statistics do
    def stargazers_count(""), do: "N/A"
    def stargazers_count(repo_ident) do
      GitHub.stargazers(repo_ident)
        |> Enum.count
    end

    def forks_count(""), do: "N/A"
    def forks_count(repo_ident) do
      GitHub.forks(repo_ident)
        |> Enum.count
    end

    def latest_commit_date(""), do: "N/A"
    def latest_commit_date(repo_ident) do
      GitHub.latest_commit(repo_ident)["commit"]["committer"]["date"]
    end
  end
end
